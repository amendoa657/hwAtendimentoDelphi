unit uValidacoes;

interface

type
  TValidacoes = class
  public
    class function NumeroSerieValido(const numeroSerie: string): Boolean;
    class function ValidarFormulario(const numeroSerie, nomeCliente, descricaoAtendimento: string; const indexModelo: Integer) : Boolean;
    class function ValidarEdicao(const descricaoAtendimento: string; const dataHoraInicio, dataHoraFim: TDateTime) : Boolean;
    class function ValidarLogin(const nome, senha: string) : Boolean;
    class function ValidarUsuario(const nome, senha: string; const indexPerfil: Integer) : Boolean;
    class function ValidarAnexo(const caminho: string) : Boolean;
  end;

implementation

uses System.RegularExpressions, Vcl.Dialogs, System.SysUtils, System.StrUtils;

class function TValidacoes.NumeroSerieValido(const numeroSerie: string): Boolean;
begin
  // 2 letras + 9 números, ex.: AB123456789
  Result := TRegEx.IsMatch(numeroSerie, '^[A-Z]{2}[0-9]{9}$');
end;

class function TValidacoes.ValidarFormulario(const numeroSerie, nomeCliente, descricaoAtendimento: string; const indexModelo: Integer) : Boolean;
begin
  Result := False;

  if not NumeroSerieValido(numeroSerie) then
  begin
    ShowMessage('Numero de serie invalido!');
    Exit;
  end;

  if indexModelo = -1 then
  begin
    ShowMessage('Selecione o modelo.');
    Exit;
  end;

  if nomeCliente = '' then
  begin
    ShowMessage('Informe o nome do cliente.');
    Exit;
  end;

  if descricaoAtendimento = '' then
  begin
    ShowMessage('Informe a descrição do atendimento.');
    Exit;
  end;

  Result := True;
end;

class function TValidacoes.ValidarEdicao(const descricaoAtendimento: string; const dataHoraInicio, dataHoraFim: TDateTime) : Boolean;
begin
  Result := False;

  if descricaoAtendimento = '' then
  begin
    ShowMessage('Informe a descrição do atendimento.');
    Exit;
  end;

  if (dataHoraFim <> 0) and (dataHoraFim < dataHoraInicio) then
  begin
    ShowMessage('O término não pode ser antes do início.');
    Exit;
  end;

  Result := True;
end;

class function TValidacoes.ValidarLogin(const nome, senha: string) : Boolean;
begin
  Result := False;

  if nome = '' then
  begin
    ShowMessage('Informe o usuário.');
    Exit;
  end;

  if senha = '' then
  begin
    ShowMessage('Informe a senha.');
    Exit;
  end;

  Result := True;
end;

class function TValidacoes.ValidarUsuario(const nome, senha: string; const indexPerfil: Integer) : Boolean;
begin
  Result := False;

  if nome = '' then
  begin
    ShowMessage('Informe o nome do usuário.');
    Exit;
  end;

  if Length(senha) < 4 then
  begin
    ShowMessage('A senha precisa ter pelo menos 4 caracteres.');
    Exit;
  end;

  if indexPerfil = -1 then
  begin
    ShowMessage('Selecione o perfil.');
    Exit;
  end;

  Result := True;
end;

class function TValidacoes.ValidarAnexo(const caminho: string) : Boolean;
var
  Arquivo : TSearchRec;
  tamanho : Int64;
begin
  Result := False;

  if MatchText(ExtractFileExt(caminho), ['.exe', '.bat', '.cmd', '.com', '.msi', '.scr', '.vbs', '.js', '.ps1']) then
  begin
    ShowMessage('Esse tipo de arquivo não pode ser anexado.');
    Exit;
  end;

  tamanho := 0;

  if FindFirst(caminho, faAnyFile, Arquivo) = 0 then
  begin
    tamanho := Arquivo.Size;
    FindClose(Arquivo);
  end;

  if tamanho = 0 then
  begin
    ShowMessage('O arquivo está vazio ou não foi encontrado.');
    Exit;
  end;

  if tamanho > 10 * 1024 * 1024 then
  begin
    ShowMessage('O arquivo passa do limite de 10 MB.');
    Exit;
  end;

  Result := True;
end;

end.
