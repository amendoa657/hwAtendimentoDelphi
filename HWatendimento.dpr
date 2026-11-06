program HWatendimento;

uses
  Vcl.Forms,
  System.UITypes,
  System.SysUtils,
  Vcl.HtmlHelpViewer,
  uValidacoes in 'src\utils\uValidacoes.pas',
  uGrid in 'src\utils\uGrid.pas',
  uNavegacao in 'src\utils\uNavegacao.pas',
  uSenha in 'src\utils\uSenha.pas',
  uSessao in 'src\utils\uSessao.pas',
  uArquivo in 'src\utils\uArquivo.pas',
  registrarAtendimento in 'src\forms\registrarAtendimento.pas' {frmRegistrarAtendimento},
  pesquisarAtendimento in 'src\forms\pesquisarAtendimento.pas' {frmPesquisarAtendimento},
  usuarios in 'src\forms\usuarios.pas' {frmUsuarios},
  login in 'src\forms\login.pas' {frmLogin},
  logAcoes in 'src\forms\logAcoes.pas' {frmLog},
  editarAtendimento in 'src\forms\editarAtendimento.pas' {frmEditarAtendimento},
  anexosAtendimento in 'src\forms\anexosAtendimento.pas' {frmAnexosAtendimento},
  uConexao in 'src\data\uConexao.pas',
  uClienteRepository in 'src\repositories\uClienteRepository.pas',
  uCliente in 'src\models\uCliente.pas',
  uUsuario in 'src\models\uUsuario.pas',
  uUsuarioRepository in 'src\repositories\uUsuarioRepository.pas',
  uEquipamento in 'src\models\uEquipamento.pas',
  uEquipamentoRepository in 'src\repositories\uEquipamentoRepository.pas',
  uAtendimento in 'src\models\uAtendimento.pas',
  uAtendimentoRepository in 'src\repositories\uAtendimentoRepository.pas',
  uLogRepository in 'src\repositories\uLogRepository.pas',
  uAnexoRepository in 'src\repositories\uAnexoRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // Ajuda (F1): o hwatendimento.chm fica na mesma pasta do .exe
  Application.HelpFile := ExtractFilePath(Application.ExeName) + 'hwatendimento.chm';

  // Conecta antes do login, que precisa consultar o banco
  if not ConectarSql then
    Exit;

  // Login antes de tudo: fechou sem entrar, o programa termina
  frmLogin := TfrmLogin.Create(nil);
  try
    if frmLogin.ShowModal <> mrOk then
      Exit;
  finally
    frmLogin.Free;
  end;

  Application.CreateForm(TfrmPesquisarAtendimento, frmPesquisarAtendimento);
  Application.Run;
end.
