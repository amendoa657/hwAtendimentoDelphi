unit uValidacoes;

{$IFDEF FPC}
  {$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  SysUtils, Classes;

type
  TValidacoes = class
    function NumeroSerieValido(const numeroSerie: string): Boolean;
    function ValidarFormulario(const numeroSerie, nomeCliente, descricaoAtendimento: string; const indexModelo: Integer) : Boolean;
    public
  end;

implementation

uses System.RegularExpressions;

function TValidacoes.NumeroSerieValido(const numeroSerie: string): Boolean;
begin
  // 2 letras + 9 números, ex.: AB123456789
  Result := TRegEx.IsMatch(numeroSerie, '^[A-Z]{2}[0-9]{9}$');
end;

function TValidacoes.ValidarFormulario(const numeroSerie, nomeCliente, descricaoAtendimento: string; const indexModelo: Integer) : Boolean;
begin
  Result := False;

  if not NumeroSerieValido(numeroSerie) then Exit;
  //ShowMessage('Numero de serie invalido!');

  if indexModelo = -1 then Exit;
  //ShowMessage('Selecione o modelo.');

  if nomeCliente = '' then Exit;
  //ShowMessage('Informe o nome do cliente.');

  if descricaoAtendimento = '' then Exit;
  //ShowMessage('Informe a descrição do atendimento.');


  Result := True;
end;



end.
