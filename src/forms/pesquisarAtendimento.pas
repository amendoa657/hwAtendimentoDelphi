unit pesquisarAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisarAtendimento = class(TForm)
    pnlCabecalho: TPanel;
    lblAppTitulo: TLabel;
    pnlLogo: TPanel;
    pnlNovoAtendimentoBorda: TPanel;
    btnNovoAtendimento: TPanel;
    pnlUsuariosBorda: TPanel;
    btnUsuarios: TPanel;
    pnlRodape: TPanel;
    shpLinhaRodape: TShape;
    pnlVoltarBorda: TPanel;
    btnVoltar: TPanel;
    pnlConteudo: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblSecaoFiltros: TLabel;
    shpLinhaFiltros: TShape;
    lblDe: TLabel;
    lblAte: TLabel;
    lblNomeCliente: TLabel;
    lblNumeroSerie: TLabel;
    lblDescricao: TLabel;
    lblTelefone: TLabel;
    lblSecaoResultados: TLabel;
    shpLinhaResultados: TShape;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    edtNomeCliente: TEdit;
    edtNumeroSerie: TEdit;
    edtDescricao: TEdit;
    edtTelefone: TEdit;
    btnPesquisar: TPanel;
    pnlLimparFiltrosBorda: TPanel;
    btnLimparFiltros: TPanel;
    lvResultados: TDBGrid;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QuerySql: TFDQuery;
    DataSource: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoAtendimentoClick(Sender: TObject);
    procedure buscarPorFiltro(const descricao, nome_cliente, numero_serie, telefone: string; const data_hora_inicio, data_hora_fim : TDateTime);
    procedure btnPesquisarClick(Sender: TObject);
  private
  public
  end;

var
  frmPesquisarAtendimento: TfrmPesquisarAtendimento;

implementation

{$R *.dfm}

uses registrarAtendimento, System.DateUtils, uConexao;

procedure TfrmPesquisarAtendimento.FormCreate(Sender: TObject);
begin
  QuerySql.Connection := Conexao;
end;

procedure TfrmPesquisarAtendimento.btnNovoAtendimentoClick(Sender: TObject);
var frmRegistrar : TfrmRegistrarAtendimento;
begin
  Close;
end;

procedure TfrmPesquisarAtendimento.btnPesquisarClick(Sender: TObject);
begin
  buscarPorFiltro(
    edtDescricao.Text,
    edtNomeCliente.Text,
    edtNumeroSerie.Text,
    edtTelefone.Text,
    dtpDe.DateTime,
    dtpAte.DateTime
  )
end;

procedure TfrmPesquisarAtendimento.buscarPorFiltro(const descricao,
  nome_cliente, numero_serie, telefone: string; const data_hora_inicio,
  data_hora_fim: TDateTime);
begin

  querySql.SQL.Text := '''
  SELECT *
  FROM atendimentosComFiltro
  WHERE (:cliente   = '' OR cliente      LIKE CONCAT('%', :cliente, '%'))
    AND (:numero_serie = '' OR numero_serie = :numero_serie)
    AND (:descricao = '' OR descricao    LIKE CONCAT('%', :descricao, '%'))
    AND (:telefone  = '' OR telefone     LIKE CONCAT('%', :telefone, '%'))
    AND (:de  IS NULL OR inicio >= :de)
    AND (:ate IS NULL OR inicio <  :ate)
  ORDER BY inicio DESC
  ''';


  QuerySql.ParamByName('cliente').AsString   := Trim(edtNomeCliente.Text);
  QuerySql.ParamByName('numero_serie').AsString     := Trim(edtNumeroSerie.Text);
  QuerySql.ParamByName('descricao').AsString := Trim(edtDescricao.Text);
  QuerySql.ParamByName('telefone').AsString  := Trim(edtTelefone.Text);

  QuerySql.ParamByName('de').DataType  := ftDateTime;
  QuerySql.ParamByName('ate').DataType := ftDateTime;

  if dtpDe.Checked then
    QuerySql.ParamByName('de').AsDateTime := DateOf(dtpDe.Date)          // 04/11 00:00
  else
    QuerySql.ParamByName('de').Clear;

  if dtpAte.Checked then
    QuerySql.ParamByName('ate').AsDateTime := DateOf(dtpAte.Date) + 1    // 05/11 00:00
  else
    QuerySql.ParamByName('ate').Clear;

  QuerySql.Open

end;

end.
