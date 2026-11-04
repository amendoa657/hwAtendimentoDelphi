unit registrarAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.MySQL, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TfrmRegistrarAtendimento = class(TForm)
    pnlCabecalho: TPanel;
    imgLogo: TImage;
    lblAppTitulo: TLabel;
    pnlPesquisarBorda: TPanel;
    btnPesquisar: TPanel;
    pnlUsuariosBorda: TPanel;
    btnUsuarios: TPanel;
    pnlLogBorda: TPanel;
    btnLog: TPanel;
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
    ConexaoSql: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QuerySql: TFDQuery;
    DataSource: TDataSource;
    lvHistorico: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TipoPessoaClick(Sender: TObject);
    procedure edtNumeroSerieChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pnlHistoricoResize(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
  private
    var
      numeroSerieEncontrado : boolean;
    procedure registroValido(const valor : boolean);
    procedure clienteDisponivel(const valor: Boolean);
    procedure LimparFormulario;
    function verificaModelo(const texto : string): Integer;
  public
  end;

var
  frmRegistrarAtendimento: TfrmRegistrarAtendimento;

implementation

uses uGrid, uValidacoes, uConexao, uClienteRepository, uCliente, uEquipamentoRepository, uEquipamento, uAtendimentoRepository, uAtendimento, System.StrUtils,
  uNavegacao;

{$R *.dfm}

{ ===== Eventos ===== }

procedure TfrmRegistrarAtendimento.FormCreate(Sender: TObject);
begin
  LimparFormulario;
  registroValido(False);
  numeroSerieEncontrado:=False;

  if not ConectarSql then
  begin
    Application.Terminate;
    Exit;
  end;

  QuerySql.Connection := Conexao;

end;

procedure TfrmRegistrarAtendimento.edtNumeroSerieChange(Sender: TObject);
begin
  cbxModelo.ItemIndex := verificaModelo(edtNumeroSerie.Text);

  if Length(edtNumeroSerie.Text)=0 then registroValido(False);
  if Length(edtNumeroSerie.Text)<11 then registroValido(False);

end;

procedure TfrmRegistrarAtendimento.btnBuscarClick(Sender: TObject);
var
  Cliente: TCliente;
begin
  lblErroSerie.Visible := false;
  Cliente := TClienteRepository.BuscarPorNumeroSerie(edtNumeroSerie.Text);

  querySql.SQL.Text := '''
  select data, cliente, descricao
  from atendimentosEquipamento
  where numero_serie = :numero_serie
  order by data desc
  ''';
  querySql.ParamByName('numero_serie').AsString := edtNumeroSerie.Text;
  querySql.Open;
  AjustarGrid(lvHistorico);

  registroValido(True);

  if Cliente <> nil then
  begin
    numeroSerieEncontrado:=True;

    Cliente := TClienteRepository.BuscarPorNumeroSerie(edtNumeroSerie.Text);

    edtNome.Text := Cliente.nome;
    edtTelefone.Text := Cliente.telefone;

    if Cliente.tipo='F' then
    begin
      rbPessoaFisica.Checked:=true;
      rbPessoaJuridica.Checked:=false;

      edtEmpresa.Enabled:=false;
    end
    else
    begin
      rbPessoaFisica.Checked:=false;
      rbPessoaJuridica.Checked:=true;

      edtEmpresa.Text:=Cliente.nome_empresa;
    end;

    clienteDisponivel(false);


  end
  else begin
    numeroSerieEncontrado :=False;
    lblErroSerie.Visible := true;
  end;

end;

procedure TfrmRegistrarAtendimento.btnSalvarClick(Sender: TObject);
var
  nome : string;
  telefone : string;
  tipo : string;
  nome_empresa : string;
  cliente_id : Integer;
  equipamento_id : Integer;
  descricao : string;
  data_hora_inicio : TDateTime;
  data_hora_fim : TDateTime;
  numero_serie : string;
  modelo : string;

  Cliente : TCliente;
begin
  nome := edtNome.Text;
  telefone := edtTelefone.Text;

  if rbPessoaJuridica.Checked then
    tipo:='J'
  else
    tipo:='F';

  nome_empresa:=edtEmpresa.Text;

  numero_serie := edtNumeroSerie.Text;

  modelo := cbxModelo.Text;

  data_hora_inicio := dtpInicioData.DateTime;

  data_hora_fim := 0;

  if dtpTerminoData.Checked then
    data_hora_fim := dtpTerminoData.DateTime;

  descricao := memDescricao.Text;




  if TValidacoes.ValidarFormulario(
      edtNumeroSerie.Text,
      edtNome.Text,
      memDescricao.Text,
      cbxModelo.ItemIndex) then
  begin
  //ShowMessage('Atendimento validado. (Gravação no banco ainda não implementada.)');
    if numeroSerieEncontrado then
    begin
      Cliente := TClienteRepository.BuscarPorNumeroSerie(edtNumeroSerie.Text);

      TAtendimentoRepository.registrarAtendimento(
        data_hora_inicio, data_hora_fim, descricao, Cliente.id, Cliente.equipamento_id
      );

    end
    else
    begin
      cliente_id := TClienteRepository.registrarCliente(
        tipo,
        nome,
        telefone,
        nome_empresa
      );

      if cliente_id<>-1 then
      begin
        equipamento_id := TEquipamentoRepository.registrarEquipamento(
          modelo,
          numero_serie,
          cliente_id
        )
      end;
      if equipamento_id<>-1 then
      begin
        TAtendimentoRepository.registrarAtendimento(
          data_hora_inicio, data_hora_fim, descricao, cliente_id, equipamento_id
        );
      end;

    end;

    ShowMessage('Atendimento gravado com sucesso!');
    limparFormulario;
  end;


end;



procedure TfrmRegistrarAtendimento.btnCancelarClick(Sender: TObject);
begin
  LimparFormulario;
end;

procedure TfrmRegistrarAtendimento.btnPesquisarClick(Sender: TObject);
begin
  AbrirTela(Self, tlPesquisar);
end;

procedure TfrmRegistrarAtendimento.TipoPessoaClick(Sender: TObject);
begin
  // Empresa só faz sentido para pessoa jurídica
  edtEmpresa.Enabled := rbPessoaJuridica.Checked;
  if not edtEmpresa.Enabled then
    edtEmpresa.Clear;
end;

{ ===== Rotinas ===== }


procedure TfrmRegistrarAtendimento.clienteDisponivel(const valor: Boolean);
begin
  if(valor) then
  begin
    rbPessoaFisica.Enabled := True;
    rbPessoaJuridica.Enabled := True;

    edtNome.Enabled := True;
    edtTelefone.Enabled := True;

    edtEmpresa.Enabled := True;
  end
  else
  begin
    rbPessoaFisica.Enabled := False;
    rbPessoaJuridica.Enabled := False;

    edtNome.Enabled := False;
    edtTelefone.Enabled := False;

    edtEmpresa.Enabled := False;
  end;
end;


procedure TfrmRegistrarAtendimento.registroValido(const valor: Boolean);
begin
  if(valor) then
  begin
    //cbxModelo.Enabled := True;

    rbPessoaFisica.Enabled := True;
    rbPessoaJuridica.Enabled := True;

    edtNome.Enabled := True;
    edtTelefone.Enabled := True;

    dtpInicioData.Enabled := True;
    dtpInicioHora.Enabled := True;

    dtpTerminoData.Enabled := True;
    dtpTerminoHora.Enabled := True;

    memDescricao.Enabled := True;

    btnSalvar.Enabled := True;
  end
  else
  begin
    cbxModelo.Enabled := False;

    rbPessoaFisica.Enabled := False;
    rbPessoaJuridica.Enabled := False;

    edtNome.Enabled := False;
    edtTelefone.Enabled := False;

    dtpInicioData.Enabled := False;
    dtpInicioHora.Enabled := False;

    dtpTerminoData.Enabled := False;
    dtpTerminoHora.Enabled := False;

    memDescricao.Enabled := False;

    btnSalvar.Enabled := False
  end;
end;

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

function TfrmRegistrarAtendimento.verificaModelo(const texto : string): Integer;
var
  modelo, versao: string;
begin
  Result:=-1;

  modelo := Copy(texto, 1, 2);
  versao := Copy(texto, 3, 2);

  case IndexText(modelo, ['EC','TE','TC','TP']) of
    0: begin
      case IndexText(versao, ['10','11']) of
        0: Result := 0;
        1: Result := 1;
      end;
    end;
    1: Result := 2;
    2: Result := 3;
    3: Result := 4;

  end;

end;


procedure TfrmRegistrarAtendimento.pnlHistoricoResize(Sender: TObject);
begin
  AjustarGrid(lvHistorico);
end;

procedure TfrmRegistrarAtendimento.btnUsuariosClick(Sender: TObject);
begin
  AbrirTela(Self, tlUsuarios);
end;

procedure TfrmRegistrarAtendimento.btnLogClick(Sender: TObject);
begin
  AbrirTela(Self, tlLog);
end;

end.
