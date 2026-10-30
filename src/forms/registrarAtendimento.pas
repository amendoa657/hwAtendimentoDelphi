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
  Vcl.DBGrids;

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
    ConexaoSql: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QuerySql: TFDQuery;
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TipoPessoaClick(Sender: TObject);
    procedure edtNumeroSerieChange(Sender: TObject);
  private
    procedure LimparFormulario;
    function verificaModelo(const texto : string): Integer;
  public
  end;

var
  frmRegistrarAtendimento: TfrmRegistrarAtendimento;

implementation

uses uValidacoes, uConexao, uClienteRepository, uCliente, System.StrUtils;

{$R *.dfm}

{ ===== Eventos ===== }

procedure TfrmRegistrarAtendimento.FormCreate(Sender: TObject);
begin
  LimparFormulario;

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
end;

procedure TfrmRegistrarAtendimento.btnBuscarClick(Sender: TObject);
var
  Cliente: TCliente;
begin
  lblErroSerie.Visible := false;
  Cliente := TClienteRepository.BuscarPorNumeroSerie(edtNumeroSerie.Text);

  if Cliente <> nil then
  begin
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


  end
  else begin
    lblErroSerie.Visible := true;
  end;

end;

procedure TfrmRegistrarAtendimento.btnSalvarClick(Sender: TObject);
begin
  if TValidacoes.ValidarFormulario(
      edtNumeroSerie.Text,
      edtNome.Text,
      memDescricao.Text,
      cbxModelo.ItemIndex) then
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


end.
