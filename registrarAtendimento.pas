unit registrarAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.RegularExpressions, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmRegistrarAtendimento = class(TForm)
    pnlCabecalho: TPanel;
    pnlLogo: TPanel;
    lblAppTitulo: TLabel;
    pnlPesquisarBorda: TPanel;
    btnPesquisar: TPanel;
    pnlUsuariosBorda: TPanel;
    btnUsuarios: TPanel;
    pnlRodape: TPanel;
    shpLinhaRodape: TShape;
    pnlCancelarBorda: TPanel;
    btnCancelar: TPanel;
    btnSalvar: TPanel;
    pnlHistorico: TPanel;
    shpSeparadorHistorico: TShape;
    lblHistoricoTitulo: TLabel;
    shpLinhaHistorico: TShape;
    lblHistoricoInfo: TLabel;
    lvHistorico: TListView;
    sbxConteudo: TScrollBox;
    pnlFormulario: TPanel;
    lblNovoAtendimento: TLabel;
    lblSubtitulo: TLabel;
    lblNumeroSerie: TLabel;
    edtNumeroSerie: TEdit;
    btnBuscar: TPanel;
    lblErroSerie: TLabel;
    lblSecaoEquipamento: TLabel;
    shpLinhaEquipamento: TShape;
    lblModelo: TLabel;
    cbxModelo: TComboBox;
    lblSecaoCliente: TLabel;
    shpLinhaCliente: TShape;
    rbPessoaFisica: TRadioButton;
    rbPessoaJuridica: TRadioButton;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    lblSecaoAtendimento: TLabel;
    shpLinhaAtendimento: TShape;
    lblInicio: TLabel;
    dtpInicioData: TDateTimePicker;
    dtpInicioHora: TDateTimePicker;
    lblTermino: TLabel;
    dtpTerminoData: TDateTimePicker;
    dtpTerminoHora: TDateTimePicker;
    lblDescricao: TLabel;
    memDescricao: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TipoPessoaClick(Sender: TObject);
  private
    procedure LimparFormulario;
    function NumeroSerieValido: Boolean;
    function ValidarFormulario: Boolean;
  public
  end;

var
  frmRegistrarAtendimento: TfrmRegistrarAtendimento;

implementation

{$R *.dfm}

{ ===== Eventos ===== }

procedure TfrmRegistrarAtendimento.FormCreate(Sender: TObject);
begin
  LimparFormulario;
end;

procedure TfrmRegistrarAtendimento.btnBuscarClick(Sender: TObject);
begin
  lblErroSerie.Visible := not NumeroSerieValido;
end;

procedure TfrmRegistrarAtendimento.btnSalvarClick(Sender: TObject);
begin
  if ValidarFormulario then
    ShowMessage('Atendimento validado. (Gravação no banco ainda não implementada.)');
end;

procedure TfrmRegistrarAtendimento.btnCancelarClick(Sender: TObject);
begin
  LimparFormulario;
end;

procedure TfrmRegistrarAtendimento.TipoPessoaClick(Sender: TObject);
begin
  // Empresa só faz sentido para pessoa jurídica
  edtEmpresa.Enabled := rbPessoaJuridica.Checked;
  if not edtEmpresa.Enabled then
    edtEmpresa.Clear;
end;

{ ===== Rotinas ===== }

procedure TfrmRegistrarAtendimento.LimparFormulario;
begin
  edtNumeroSerie.Clear;
  lblErroSerie.Visible := False;
  cbxModelo.ItemIndex := -1;
  rbPessoaFisica.Checked := True;
  edtEmpresa.Clear;
  edtEmpresa.Enabled := False;
  edtNome.Clear;
  edtTelefone.Clear;
  dtpInicioData.Date := Now;
  dtpInicioHora.Time := Now;
  dtpTerminoData.Date := Now;
  dtpTerminoHora.Time := Now;
  dtpTerminoData.Checked := False;
  memDescricao.Clear;
end;

{ ===== Funções ===== }

function TfrmRegistrarAtendimento.NumeroSerieValido: Boolean;
begin
  // 2 letras + 9 números, ex.: AB123456789
  Result := TRegEx.IsMatch(edtNumeroSerie.Text, '^[A-Z]{2}[0-9]{9}$');
end;

function TfrmRegistrarAtendimento.ValidarFormulario: Boolean;
begin
  Result := False;

  if not NumeroSerieValido then
  begin
    lblErroSerie.Visible := True;
    ShowMessage('Número de série inválido.');
    Exit;
  end;

  if cbxModelo.ItemIndex = -1 then
  begin
    ShowMessage('Selecione o modelo.');
    Exit;
  end;

  if edtNome.Text = '' then
  begin
    ShowMessage('Informe o nome do cliente.');
    Exit;
  end;

  if memDescricao.Text = '' then
  begin
    ShowMessage('Informe a descrição do atendimento.');
    Exit;
  end;

  Result := True;
end;

end.
