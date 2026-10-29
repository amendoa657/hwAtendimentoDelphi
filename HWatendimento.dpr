program HWatendimento;

uses
  Vcl.Forms,
  uValidacoes in 'src\utils\uValidacoes.pas',
  registrarAtendimento in 'src\forms\registrarAtendimento.pas' {frmRegistrarAtendimento},
  uDmConexao in 'src\data\uDmConexao.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRegistrarAtendimento, frmRegistrarAtendimento);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
