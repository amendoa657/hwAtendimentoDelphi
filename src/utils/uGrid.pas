unit uGrid;

interface

uses
  Vcl.DBGrids;

// Deixa a grid com títulos legíveis e as colunas ocupando toda a largura.
// Chamar depois de abrir a query e quando a grid mudar de tamanho.
procedure AjustarGrid(AGrid: TDBGrid);

implementation

uses
  Winapi.Windows, System.SysUtils, System.Math, Data.DB, Data.SqlTimSt;

type
  // Mostra o texto dos campos TEXT do banco (senão a grid mostra "(WIDEMEMO)")
  TTextoMemo = class
    class procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  end;

class procedure TTextoMemo.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

function TituloAmigavel(const ANomeCampo: string): string;
begin
  if SameText(ANomeCampo, 'data') then Exit('Data');
  if SameText(ANomeCampo, 'inicio') then Exit('Início');
  if SameText(ANomeCampo, 'numero_serie') then Exit('Nº de série');
  if SameText(ANomeCampo, 'descricao') then Exit('Descrição');
  if SameText(ANomeCampo, 'duracao') then Exit('Duração');
  if SameText(ANomeCampo, 'responsavel') then Exit('Responsável');
  if SameText(ANomeCampo, 'usuario') then Exit('Usuário');
  if SameText(ANomeCampo, 'acao') then Exit('Ação');

  // padrão: "nome_cliente" vira "Nome cliente"
  Result := StringReplace(ANomeCampo, '_', ' ', [rfReplaceAll]);
  if Result <> '' then
    Result[1] := UpCase(Result[1]);
end;

procedure PrepararCampos(AGrid: TDBGrid);
var
  Campo: TField;
begin
  if not Assigned(AGrid.DataSource) or not Assigned(AGrid.DataSource.DataSet) then
    Exit;

  for Campo in AGrid.DataSource.DataSet.Fields do
  begin
    if Campo.DisplayLabel = Campo.FieldName then
      Campo.DisplayLabel := TituloAmigavel(Campo.FieldName);

    if Campo.DataType in [ftMemo, ftWideMemo] then
      Campo.OnGetText := TTextoMemo.GetText;

    // data e hora sem os segundos
    if (Campo is TDateTimeField) and (Campo.DataType = ftDateTime)
      and (TDateTimeField(Campo).DisplayFormat = '') then
      TDateTimeField(Campo).DisplayFormat := 'dd/mm/yyyy hh:nn';
    if (Campo is TSQLTimeStampField) and (TSQLTimeStampField(Campo).DisplayFormat = '') then
      TSQLTimeStampField(Campo).DisplayFormat := 'dd/mm/yyyy hh:nn';
  end;
end;

procedure AjustarGrid(AGrid: TDBGrid);
var
  Espaco, I, Disponivel, TotalMinimo, TotalPeso, Sobra, Usado: Integer;
  Minimo, Peso: array of Integer;
  Campo: TField;
  Exemplo: string;
begin
  if not AGrid.HandleAllocated then
    Exit;

  PrepararCampos(AGrid);
  if AGrid.Columns.Count = 0 then
    Exit;

  Espaco := MulDiv(16, AGrid.CurrentPPI, 96); // folga dentro de cada célula
  SetLength(Minimo, AGrid.Columns.Count);
  SetLength(Peso, AGrid.Columns.Count);
  TotalMinimo := 0;
  TotalPeso := 0;

  for I := 0 to AGrid.Columns.Count - 1 do
  begin
    Campo := AGrid.Columns[I].Field;
    Exemplo := '';
    Peso[I] := 1; // texto: estica conforme o espaço que sobrar

    if Assigned(Campo) then
    begin
      if Campo.DataType in [ftMemo, ftWideMemo] then
        Peso[I] := 2 // descrição fica com a maior parte
      else if Campo.DataType = ftDate then
        Exemplo := '00/00/0000'
      else if Campo.DataType = ftTime then
        Exemplo := '00:00:00'
      else if Campo.DataType in [ftDateTime, ftTimeStamp] then
        Exemplo := '00/00/0000 00:00'
      else if Campo is TNumericField then
        Exemplo := '000000';

      if Exemplo <> '' then
        Peso[I] := 0; // datas e números têm tamanho fixo
    end;

    // largura mínima: o maior entre o título e o conteúdo de exemplo
    AGrid.Canvas.Font := AGrid.TitleFont;
    Minimo[I] := AGrid.Canvas.TextWidth(AGrid.Columns[I].Title.Caption);
    AGrid.Canvas.Font := AGrid.Font;
    Minimo[I] := Max(Minimo[I], AGrid.Canvas.TextWidth(Exemplo)) + Espaco;

    Inc(TotalMinimo, Minimo[I]);
    Inc(TotalPeso, Peso[I]);
  end;

  // largura útil: tira as linhas entre colunas e a barra de rolagem vertical
  Disponivel := AGrid.ClientWidth - AGrid.Columns.Count;
  if (GetWindowLong(AGrid.Handle, GWL_STYLE) and WS_VSCROLL) = 0 then
    Dec(Disponivel, GetSystemMetrics(SM_CXVSCROLL));

  // o espaço que sobra vai para as colunas de texto, conforme o peso
  Sobra := Max(Disponivel - TotalMinimo, 0);
  Usado := 0;
  for I := 0 to AGrid.Columns.Count - 1 do
  begin
    if TotalPeso > 0 then
      AGrid.Columns[I].Width := Minimo[I] + (Sobra * Peso[I]) div TotalPeso
    else
      AGrid.Columns[I].Width := Minimo[I] + Sobra div AGrid.Columns.Count;
    Inc(Usado, AGrid.Columns[I].Width);
  end;

  // o arredondamento que faltou vai para a última coluna, fechando a largura exata
  if Usado < Disponivel then
    AGrid.Columns[AGrid.Columns.Count - 1].Width :=
      AGrid.Columns[AGrid.Columns.Count - 1].Width + (Disponivel - Usado);
end;

end.
