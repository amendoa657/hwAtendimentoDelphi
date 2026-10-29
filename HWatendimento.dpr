program HWatendimento;

uses
  Vcl.Forms,
  registrarAtendimento in 'registrarAtendimento.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRegistrarAtendimento, frmRegistrarAtendimento);
  Application.Run;
end.
