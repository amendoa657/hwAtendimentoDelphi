program HWatendimento;

uses
  Vcl.Forms,
  System.UITypes,
  uValidacoes in 'src\utils\uValidacoes.pas',
  uGrid in 'src\utils\uGrid.pas',
  uNavegacao in 'src\utils\uNavegacao.pas',
  registrarAtendimento in 'src\forms\registrarAtendimento.pas' {frmRegistrarAtendimento},
  pesquisarAtendimento in 'src\forms\pesquisarAtendimento.pas' {frmPesquisarAtendimento},
  usuarios in 'src\forms\usuarios.pas' {frmUsuarios},
  login in 'src\forms\login.pas' {frmLogin},
  logAcoes in 'src\forms\logAcoes.pas' {frmLog},
  editarAtendimento in 'src\forms\editarAtendimento.pas' {frmEditarAtendimento},
  uConexao in 'src\data\uConexao.pas',
  uClienteRepository in 'src\repositories\uClienteRepository.pas',
  uCliente in 'src\models\uCliente.pas',
  uEquipamento in 'src\models\uEquipamento.pas',
  uEquipamentoRepository in 'src\repositories\uEquipamentoRepository.pas',
  uAtendimento in 'src\models\uAtendimento.pas',
  uAtendimentoRepository in 'src\repositories\uAtendimentoRepository.pas',
  uLogRepository in 'src\repositories\uLogRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // Login antes de tudo: fechou sem entrar, o programa termina
  frmLogin := TfrmLogin.Create(nil);
  try
    if frmLogin.ShowModal <> mrOk then
      Exit;
  finally
    frmLogin.Free;
  end;

  Application.CreateForm(TfrmRegistrarAtendimento, frmRegistrarAtendimento);
  Application.Run;
end.
