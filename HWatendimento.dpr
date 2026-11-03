program HWatendimento;

uses
  Vcl.Forms,
  uValidacoes in 'src\utils\uValidacoes.pas',
  registrarAtendimento in 'src\forms\registrarAtendimento.pas' {frmRegistrarAtendimento},
  pesquisarAtendimento in 'src\forms\pesquisarAtendimento.pas' {frmPesquisarAtendimento},
  uConexao in 'src\data\uConexao.pas',
  uClienteRepository in 'src\repositories\uClienteRepository.pas',
  uCliente in 'src\models\uCliente.pas',
  uEquipamento in 'src\models\uEquipamento.pas',
  uEquipamentoRepository in 'src\repositories\uEquipamentoRepository.pas',
  uAtendimento in 'src\models\uAtendimento.pas',
  uAtendimentoRepository in 'src\repositories\uAtendimentoRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRegistrarAtendimento, frmRegistrarAtendimento);
  Application.Run;
end.
