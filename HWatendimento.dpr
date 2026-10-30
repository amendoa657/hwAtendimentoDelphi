program HWatendimento;

uses
  Vcl.Forms,
  uValidacoes in 'src\utils\uValidacoes.pas',
  registrarAtendimento in 'src\forms\registrarAtendimento.pas' {frmRegistrarAtendimento},
  uConexao in 'src\data\uConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRegistrarAtendimento, frmRegistrarAtendimento);
  Application.Run;
end.
