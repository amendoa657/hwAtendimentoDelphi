unit uConexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.Phys.MySQL, FireDAC.DApt, FireDAC.VCLUI.Wait;

var
  Conexao: TFDConnection;

function ConectarSql: Boolean;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

function ConectarSql: Boolean;
begin
  Conexao := TFDConnection.Create(nil);
  Conexao.LoginPrompt := False;
  Conexao.Params.Add('DriverID=MySQL');
  Conexao.Params.Add('Server=localhost');
  Conexao.Params.Add('Port=3306');
  Conexao.Params.Add('Database=hwatendimento');
  Conexao.Params.Add('User_Name=root');
  Conexao.Params.Add('Password=');

  try
    Conexao.Connected := True;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao conectar: ' + E.Message);
      Result := False;
    end;
  end;
end;

initialization

finalization
  Conexao.Free;

end.
