unit editarAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmEditarAtendimento = class(TForm)
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblSecaoEquipamento: TLabel;
    shpLinhaEquipamento: TShape;
    lblNumeroSerie: TLabel;
    lblNumeroSerieValor: TLabel;
    lblModelo: TLabel;
    lblModeloValor: TLabel;
    lblCliente: TLabel;
    lblClienteValor: TLabel;
    lblTelefone: TLabel;
    lblTelefoneValor: TLabel;
    lblSecaoAtendimento: TLabel;
    shpLinhaAtendimento: TShape;
    lblInicio: TLabel;
    lblTermino: TLabel;
    lblDescricao: TLabel;
    dtpInicioData: TDateTimePicker;
    dtpInicioHora: TDateTimePicker;
    dtpTerminoData: TDateTimePicker;
    dtpTerminoHora: TDateTimePicker;
    memDescricao: TMemo;
    lblSecaoAnexos: TLabel;
    shpLinhaAnexos: TShape;
    lvAnexos: TDBGrid;
    btnAnexar: TPanel;
    pnlAbrirAnexoBorda: TPanel;
    btnAbrirAnexo: TPanel;
    pnlSalvarAnexoBorda: TPanel;
    btnSalvarAnexo: TPanel;
    pnlRemoverAnexoBorda: TPanel;
    btnRemoverAnexo: TPanel;
    pnlRodape: TPanel;
    shpLinhaRodape: TShape;
    pnlCancelarBorda: TPanel;
    btnCancelar: TPanel;
    btnSalvar: TPanel;
    QueryAnexos: TFDQuery;
    dsAnexos: TDataSource;
    dlgAbrirAnexo: TOpenDialog;
    dlgSalvarAnexo: TSaveDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAnexarClick(Sender: TObject);
    procedure btnAbrirAnexoClick(Sender: TObject);
    procedure btnSalvarAnexoClick(Sender: TObject);
    procedure btnRemoverAnexoClick(Sender: TObject);
  private
    var
      atendimento_id : Integer;
      cliente_id : Integer;
    procedure carregarAnexos;
  public
    function carregarAtendimento(const id : Integer; const numero_serie, modelo, cliente, telefone : string) : Boolean;
  end;

var
  frmEditarAtendimento: TfrmEditarAtendimento;

implementation

{$R *.dfm}

uses System.DateUtils, System.UITypes, uArquivo, uAtendimento, uAtendimentoRepository, uValidacoes, uLogRepository, uSessao,
  uConexao, uGrid, uAnexoRepository;

procedure TfrmEditarAtendimento.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditarAtendimento.btnSalvarClick(Sender: TObject);
var
  data_hora_inicio : TDateTime;
  data_hora_fim : TDateTime;
  descricao : string;
  usuario_id : Integer;
begin
  data_hora_inicio := DateOf(dtpInicioData.Date) + TimeOf(dtpInicioHora.Time);

  data_hora_fim := 0;

  if dtpTerminoData.Checked then
    data_hora_fim := DateOf(dtpTerminoData.Date) + TimeOf(dtpTerminoHora.Time);

  descricao := memDescricao.Text;

  usuario_id := 0;

  if not TSessao.temPermissao('editar_atendimento') then
    usuario_id := TSessao.usuario.id;

  if TValidacoes.ValidarEdicao(
      descricao,
      data_hora_inicio,
      data_hora_fim) then
  begin
    if TAtendimentoRepository.atualizarAtendimento(
      atendimento_id,
      data_hora_inicio,
      data_hora_fim,
      descricao,
      usuario_id
    ) then
    begin
      TLogRepository.registrarLog(
        TSessao.usuario.id,
        cliente_id,
        atendimento_id,
        'Editou',
        'atendimento',
        'Editou o atendimento de ' + lblClienteValor.Caption
      );

      ShowMessage('Atendimento atualizado com sucesso!');
      ModalResult := mrOk;
    end;
  end;
end;

function TfrmEditarAtendimento.carregarAtendimento(const id : Integer; const numero_serie, modelo, cliente, telefone : string) : Boolean;
var
  Atendimento : TAtendimento;
begin
  Result := false;
  atendimento_id := id;

  QueryAnexos.Connection := Conexao;

  lblNumeroSerieValor.Caption := numero_serie;
  lblModeloValor.Caption := modelo;
  lblClienteValor.Caption := cliente;
  lblTelefoneValor.Caption := telefone;

  Atendimento := TAtendimentoRepository.buscarAtendimentoPorId(id);

  if Atendimento = nil then
  begin
    ShowMessage('Atendimento não encontrado.');
    Exit;
  end;

  try
    cliente_id := Atendimento.cliente_id;

    dtpInicioData.Date := DateOf(Atendimento.data_hora_inicio);
    dtpInicioHora.Time := TimeOf(Atendimento.data_hora_inicio);

    if Atendimento.data_hora_fim = 0 then
      dtpTerminoData.Checked := false
    else
    begin
      dtpTerminoData.Date := DateOf(Atendimento.data_hora_fim);
      dtpTerminoHora.Time := TimeOf(Atendimento.data_hora_fim);
      dtpTerminoData.Checked := true;
    end;

    memDescricao.Text := Atendimento.descricao;
    Result := true;
  finally
    Atendimento.Free;
  end;

  carregarAnexos;
end;

procedure TfrmEditarAtendimento.FormShow(Sender: TObject);
begin
  AjustarGrid(lvAnexos);
end;

procedure TfrmEditarAtendimento.btnAnexarClick(Sender: TObject);
var
  caminho : string;
  anexo_id : Integer;
begin
  if not dlgAbrirAnexo.Execute then
    Exit;

  caminho := dlgAbrirAnexo.FileName;

  if TValidacoes.ValidarAnexo(caminho) then
  begin
    anexo_id := TAnexoRepository.registrarAnexo(
      atendimento_id,
      TSessao.usuario.id,
      caminho
    );

    if anexo_id <> -1 then
    begin
      TLogRepository.registrarLog(
        TSessao.usuario.id,
        cliente_id,
        anexo_id,
        'Criou',
        'anexo',
        'Anexou o arquivo ' + ExtractFileName(caminho) + ' ao atendimento de ' + lblClienteValor.Caption
      );

      carregarAnexos;
    end;
  end;
end;

procedure TfrmEditarAtendimento.btnAbrirAnexoClick(Sender: TObject);
var
  id : Integer;
  caminho : string;
begin
  if not QueryAnexos.Active or QueryAnexos.IsEmpty then
  begin
    ShowMessage('Selecione um anexo.');
    Exit;
  end;

  id := QueryAnexos.FieldByName('id').AsInteger;
  caminho := TArquivo.caminhoTemporario(QueryAnexos.FieldByName('Arquivo').AsString);

  if TAnexoRepository.salvarAnexoEmArquivo(id, caminho) then
    TArquivo.abrir(caminho);
end;

procedure TfrmEditarAtendimento.btnSalvarAnexoClick(Sender: TObject);
var
  id : Integer;
begin
  if not QueryAnexos.Active or QueryAnexos.IsEmpty then
  begin
    ShowMessage('Selecione um anexo.');
    Exit;
  end;

  id := QueryAnexos.FieldByName('id').AsInteger;
  dlgSalvarAnexo.FileName := QueryAnexos.FieldByName('Arquivo').AsString;

  if not dlgSalvarAnexo.Execute then
    Exit;

  if TAnexoRepository.salvarAnexoEmArquivo(id, dlgSalvarAnexo.FileName) then
    ShowMessage('Arquivo salvo com sucesso!');
end;

procedure TfrmEditarAtendimento.btnRemoverAnexoClick(Sender: TObject);
var
  id : Integer;
  nome_arquivo : string;
begin
  if not QueryAnexos.Active or QueryAnexos.IsEmpty then
  begin
    ShowMessage('Selecione um anexo.');
    Exit;
  end;

  id := QueryAnexos.FieldByName('id').AsInteger;
  nome_arquivo := QueryAnexos.FieldByName('Arquivo').AsString;

  if MessageDlg(
    'Remover o anexo ' + nome_arquivo + '?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  if TAnexoRepository.excluirAnexo(id) then
  begin
    TLogRepository.registrarLog(
      TSessao.usuario.id,
      cliente_id,
      id,
      'Excluiu',
      'anexo',
      'Removeu o arquivo ' + nome_arquivo + ' do atendimento de ' + lblClienteValor.Caption
    );

    carregarAnexos;
  end;
end;

procedure TfrmEditarAtendimento.carregarAnexos;
begin
  QueryAnexos.SQL.Text := '''
    select
      atendimento_anexo.id as id,
      atendimento_anexo.nome_arquivo as Arquivo,
      concat(round(atendimento_anexo.tamanho_bytes / 1024), ' KB') as Tamanho,
      usuario.nome as Usuario,
      atendimento_anexo.criado_em as criado_em
    from atendimento_anexo
      inner join usuario on usuario.id=atendimento_anexo.usuario_id
    where
      atendimento_anexo.atendimento_id=:atendimento_id
    order by atendimento_anexo.criado_em
    ''';
  QueryAnexos.ParamByName('atendimento_id').AsInteger := atendimento_id;
  QueryAnexos.Open;
  QueryAnexos.FieldByName('id').Visible := false;
  AjustarGrid(lvAnexos);
end;

end.
