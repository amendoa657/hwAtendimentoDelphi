unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.UI;   // o Delphi coloca isso sozinho

type
  TdmConexao = class(TDataModule)
    conBanco: TFDConnection;                       // componentes
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);   // evento, sem "TdmConexao."
  private
  public
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  conBanco.DriverName := 'SQLite';
  conBanco.Params.Database := ExtractFilePath(ParamStr(0)) + 'hwatendimento.db';
  conBanco.Connected := True;

  conBanco.ExecSQL(
    'CREATE TABLE IF NOT EXISTS atendimento (' +
    '  id            INTEGER PRIMARY KEY AUTOINCREMENT,' +
    '  numero_serie  VARCHAR(11)  NOT NULL,' +
    '  modelo        VARCHAR(20)  NOT NULL,' +
    '  nome_cliente  VARCHAR(100) NOT NULL,' +
    '  inicio        DATETIME     NOT NULL,' +
    '  descricao     TEXT         NOT NULL' +
    ')');
end;

end.
