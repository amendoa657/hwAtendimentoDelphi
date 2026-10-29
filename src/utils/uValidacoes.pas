unit uValidacoes;

interface

type
  TValidacoes = class
  public
    class function NumeroSerieValido(const numeroSerie: string): Boolean;
    class function ValidarFormulario(const numeroSerie, nomeCliente, descricaoAtendimento: string; const indexModelo: Integer) : Boolean;
  end;

implementation

uses System.RegularExpressions, Vcl.Dialogs;

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

end.
