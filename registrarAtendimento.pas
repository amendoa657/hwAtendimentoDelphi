unit registrarAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes,
  System.DateUtils, System.RegularExpressions, Vcl.Graphics, Vcl.ComCtrls, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

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
    procedure pnlFormularioResize(Sender: TObject);
    procedure edtNumeroSerieChange(Sender: TObject);
    procedure edtNumeroSerieKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarClick(Sender: TObject);
    procedure TipoPessoaClick(Sender: TObject);
    procedure edtTelefoneChange(Sender: TObject);
    procedure dtpTerminoDataChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FFormatandoTelefone: Boolean;
    function Escala(AValor: Integer): Integer;
    function NumeroSerieValido: Boolean;
    function SomenteDigitos(const ATexto: string): string;
    function FormatarTelefone(const ADigitos: string): string;
    function InicioAtendimento: TDateTime;
    function TerminoAtendimento: TDateTime;
    function PossuiDadosPreenchidos: Boolean;
    function ValidarFormulario: Boolean;
    procedure AtualizarTipoPessoa;
    procedure CarregarHistorico(const ANumeroSerie: string);
    procedure GravarAtendimento;
    procedure LimparFormulario;
    procedure Avisar(const AMensagem: string; AControle: TWinControl);
  public
    { Public declarations }
  end;

var
  frmRegistrarAtendimento: TfrmRegistrarAtendimento;

implementation

{$R *.dfm}

const
  // Formato do número de série: 2 letras + 9 dígitos (ex.: AB123456789)
  PADRAO_NUMERO_SERIE = '^[A-Z]{2}[0-9]{9}$';

{ TfrmRegistrarAtendimento }

procedure TfrmRegistrarAtendimento.FormCreate(Sender: TObject);
begin
  LimparFormulario;
end;

function TfrmRegistrarAtendimento.Escala(AValor: Integer): Integer;
begin
  Result := MulDiv(AValor, CurrentPPI, 96);
end;

procedure TfrmRegistrarAtendimento.pnlFormularioResize(Sender: TObject);
var
  Margem, Espaco, LarguraColuna, LeftColuna2, LarguraHora: Integer;
begin
  if csLoading in ComponentState then
    Exit;

  // Mantém as linhas de duas colunas (Nome/Telefone, Início/Término) com 50% cada
  Margem := lblNovoAtendimento.Left;
  Espaco := Escala(16);
  LarguraHora := Escala(80);
  LarguraColuna := (pnlFormulario.ClientWidth - 2 * Margem - Espaco) div 2;
  LeftColuna2 := Margem + LarguraColuna + Espaco;

  edtNome.SetBounds(Margem, edtNome.Top, LarguraColuna, edtNome.Height);
  lblTelefone.Left := LeftColuna2;
  edtTelefone.SetBounds(LeftColuna2, edtTelefone.Top, LarguraColuna, edtTelefone.Height);

  dtpInicioData.SetBounds(Margem, dtpInicioData.Top,
    LarguraColuna - LarguraHora - Escala(8), dtpInicioData.Height);
  dtpInicioHora.SetBounds(Margem + LarguraColuna - LarguraHora, dtpInicioHora.Top,
    LarguraHora, dtpInicioHora.Height);

  lblTermino.Left := LeftColuna2;
  dtpTerminoData.SetBounds(LeftColuna2, dtpTerminoData.Top,
    LarguraColuna - LarguraHora - Escala(8), dtpTerminoData.Height);
  dtpTerminoHora.SetBounds(LeftColuna2 + LarguraColuna - LarguraHora, dtpTerminoHora.Top,
    LarguraHora, dtpTerminoHora.Height);

  // Linhas divisórias das seções começam logo após o título
  shpLinhaEquipamento.SetBounds(lblSecaoEquipamento.BoundsRect.Right + Escala(12),
    shpLinhaEquipamento.Top, 0, 1);
  shpLinhaEquipamento.Width := pnlFormulario.ClientWidth - Margem - shpLinhaEquipamento.Left;
  shpLinhaCliente.SetBounds(lblSecaoCliente.BoundsRect.Right + Escala(12),
    shpLinhaCliente.Top, 0, 1);
  shpLinhaCliente.Width := pnlFormulario.ClientWidth - Margem - shpLinhaCliente.Left;
  shpLinhaAtendimento.SetBounds(lblSecaoAtendimento.BoundsRect.Right + Escala(12),
    shpLinhaAtendimento.Top, 0, 1);
  shpLinhaAtendimento.Width := pnlFormulario.ClientWidth - Margem - shpLinhaAtendimento.Left;

  // Botão Buscar com a mesma altura do campo de número de série
  btnBuscar.SetBounds(btnBuscar.Left, edtNumeroSerie.Top, btnBuscar.Width, edtNumeroSerie.Height);
end;

function TfrmRegistrarAtendimento.NumeroSerieValido: Boolean;
begin
  Result := TRegEx.IsMatch(Trim(edtNumeroSerie.Text), PADRAO_NUMERO_SERIE);
end;

procedure TfrmRegistrarAtendimento.edtNumeroSerieChange(Sender: TObject);
begin
  lblErroSerie.Visible := False;
end;

procedure TfrmRegistrarAtendimento.edtNumeroSerieKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btnBuscarClick(btnBuscar);
  end;
end;

procedure TfrmRegistrarAtendimento.btnBuscarClick(Sender: TObject);
begin
  lblErroSerie.Visible := not NumeroSerieValido;
  if lblErroSerie.Visible then
  begin
    edtNumeroSerie.SetFocus;
    Exit;
  end;

  CarregarHistorico(Trim(edtNumeroSerie.Text));
  cbxModelo.SetFocus;
end;

procedure TfrmRegistrarAtendimento.CarregarHistorico(const ANumeroSerie: string);
begin
  lvHistorico.Items.BeginUpdate;
  try
    lvHistorico.Items.Clear;
    // TODO: buscar no banco os atendimentos anteriores do equipamento ANumeroSerie
    // e adicionar em lvHistorico (Caption = data, SubItems = cliente, descrição).
  finally
    lvHistorico.Items.EndUpdate;
  end;

  lvHistorico.Visible := lvHistorico.Items.Count > 0;
  if lvHistorico.Visible then
    lblHistoricoInfo.Caption := Format('Atendimentos anteriores do equipamento %s:', [ANumeroSerie])
  else
    lblHistoricoInfo.Caption := Format('Nenhum atendimento anterior encontrado para %s.', [ANumeroSerie]);
end;

procedure TfrmRegistrarAtendimento.TipoPessoaClick(Sender: TObject);
begin
  AtualizarTipoPessoa;
end;

procedure TfrmRegistrarAtendimento.AtualizarTipoPessoa;
begin
  edtEmpresa.Enabled := rbPessoaJuridica.Checked;
  if edtEmpresa.Enabled then
  begin
    edtEmpresa.Color := clWindow;
    edtEmpresa.TextHint := 'Razão social da empresa';
  end
  else
  begin
    edtEmpresa.Clear;
    edtEmpresa.Color := $00FAF8F7;
    edtEmpresa.TextHint := 'Somente para pessoa jurídica';
  end;
end;

function TfrmRegistrarAtendimento.SomenteDigitos(const ATexto: string): string;
var
  C: Char;
begin
  Result := '';
  for C in ATexto do
    if CharInSet(C, ['0'..'9']) then
      Result := Result + C;
end;

function TfrmRegistrarAtendimento.FormatarTelefone(const ADigitos: string): string;
var
  Numero: string;
  TamanhoPrefixo: Integer;
begin
  if ADigitos = '' then
    Exit('');

  Result := '(' + Copy(ADigitos, 1, 2);
  if Length(ADigitos) <= 2 then
    Exit;

  Numero := Copy(ADigitos, 3, 9);
  // Celular (9 dígitos): 00000-0000 / Fixo (8 dígitos): 0000-0000
  if Length(Numero) = 9 then
    TamanhoPrefixo := 5
  else
    TamanhoPrefixo := 4;

  Result := Result + ') ' + Copy(Numero, 1, TamanhoPrefixo);
  if Length(Numero) > TamanhoPrefixo then
    Result := Result + '-' + Copy(Numero, TamanhoPrefixo + 1, MaxInt);
end;

procedure TfrmRegistrarAtendimento.edtTelefoneChange(Sender: TObject);
var
  Formatado: string;
begin
  if FFormatandoTelefone then
    Exit;

  Formatado := FormatarTelefone(Copy(SomenteDigitos(edtTelefone.Text), 1, 11));
  if Formatado = edtTelefone.Text then
    Exit;

  FFormatandoTelefone := True;
  try
    edtTelefone.Text := Formatado;
    edtTelefone.SelStart := Length(Formatado);
  finally
    FFormatandoTelefone := False;
  end;
end;

procedure TfrmRegistrarAtendimento.dtpTerminoDataChange(Sender: TObject);
begin
  // Sem data de término marcada o atendimento fica "em aberto"
  dtpTerminoHora.Enabled := dtpTerminoData.Checked;
end;





procedure TfrmRegistrarAtendimento.btnCancelarClick(Sender: TObject);
begin
  if PossuiDadosPreenchidos and
    (MessageDlg('Descartar os dados preenchidos?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    Exit;

  LimparFormulario;
end;

procedure TfrmRegistrarAtendimento.btnSalvarClick(Sender: TObject);
begin
  if ValidarFormulario then
    GravarAtendimento;
end;



function TfrmRegistrarAtendimento.InicioAtendimento: TDateTime;
begin
  Result := DateOf(dtpInicioData.Date) + TimeOf(dtpInicioHora.Time);
end;

function TfrmRegistrarAtendimento.TerminoAtendimento: TDateTime;
begin
  Result := DateOf(dtpTerminoData.Date) + TimeOf(dtpTerminoHora.Time);
end;

procedure TfrmRegistrarAtendimento.Avisar(const AMensagem: string; AControle: TWinControl);
begin
  MessageDlg(AMensagem, mtWarning, [mbOK], 0);
  if Assigned(AControle) and AControle.CanFocus then
    AControle.SetFocus;
end;

procedure TfrmRegistrarAtendimento.GravarAtendimento;
begin
  // TODO: gravar no banco. Dados disponíveis:
  //   Número de série: Trim(edtNumeroSerie.Text)
  //   Modelo:          cbxModelo.Text
  //   Pessoa jurídica: rbPessoaJuridica.Checked / Empresa: Trim(edtEmpresa.Text)
  //   Nome:            Trim(edtNome.Text) / Telefone: SomenteDigitos(edtTelefone.Text)
  //   Início:          InicioAtendimento
  //   Término:         TerminoAtendimento (somente se dtpTerminoData.Checked; senão em aberto)
  //   Descrição:       Trim(memDescricao.Text)
  MessageDlg('Atendimento validado. A gravação no banco ainda não foi implementada.',
      mtInformation, [mbOK], 0);
end;

procedure TfrmRegistrarAtendimento.LimparFormulario;
var
  Agora: TDateTime;
begin
  Agora := Now;

  edtNumeroSerie.Clear;
  lblErroSerie.Visible := False;
  cbxModelo.ItemIndex := -1;
  rbPessoaFisica.Checked := True;
  AtualizarTipoPessoa;
  edtNome.Clear;
  edtTelefone.Clear;
  dtpInicioData.Date := DateOf(Agora);
  dtpInicioHora.Time := TimeOf(Agora);
  dtpTerminoData.Date := DateOf(Agora);
  dtpTerminoHora.Time := TimeOf(Agora);
  dtpTerminoData.Checked := False;
  dtpTerminoHora.Enabled := False;
  memDescricao.Clear;

  lvHistorico.Items.Clear;
  lvHistorico.Visible := False;
  lblHistoricoInfo.Caption := 'Busque um número de série para ver os atendimentos anteriores.';

  if edtNumeroSerie.CanFocus then
    edtNumeroSerie.SetFocus
  else
    ActiveControl := edtNumeroSerie;
end;

function TfrmRegistrarAtendimento.ValidarFormulario: Boolean;
begin
  Result := False;

  if not NumeroSerieValido then
  begin
    lblErroSerie.Visible := True;
    Avisar('Informe um número de série válido (ex.: AB123456789).', edtNumeroSerie);
    Exit;
  end;

  if cbxModelo.ItemIndex < 0 then
  begin
    Avisar('Selecione o modelo do equipamento.', cbxModelo);
    Exit;
  end;

  if rbPessoaJuridica.Checked and (Trim(edtEmpresa.Text) = '') then
  begin
    Avisar('Informe a empresa do cliente.', edtEmpresa);
    Exit;
  end;

  if Trim(edtNome.Text) = '' then
  begin
    Avisar('Informe o nome do cliente.', edtNome);
    Exit;
  end;

  if (edtTelefone.Text <> '') and not (Length(SomenteDigitos(edtTelefone.Text)) in [10, 11]) then
  begin
    Avisar('Telefone incompleto. Use o formato (00) 00000-0000.', edtTelefone);
    Exit;
  end;

  if dtpTerminoData.Checked and (TerminoAtendimento < InicioAtendimento) then
  begin
    Avisar('O término não pode ser anterior ao início do atendimento.', dtpTerminoData);
    Exit;
  end;

  if Trim(memDescricao.Text) = '' then
  begin
    Avisar('Descreva o que foi verificado e o que foi feito no atendimento.', memDescricao);
    Exit;
  end;

  Result := True;
end;

function TfrmRegistrarAtendimento.PossuiDadosPreenchidos: Boolean;
begin
  Result := (Trim(edtNumeroSerie.Text) <> '') or (cbxModelo.ItemIndex >= 0)
      or (Trim(edtEmpresa.Text) <> '') or (Trim(edtNome.Text) <> '')
      or (Trim(edtTelefone.Text) <> '') or (Trim(memDescricao.Text) <> '');
end;

end.


