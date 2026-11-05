unit logAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLog = class(TForm)
    pnlCabecalho: TPanel;
    lblAppTitulo: TLabel;
    imgLogo: TImage;
    pnlPesquisarBorda: TPanel;
    btnPesquisar: TPanel;
    pnlUsuariosBorda: TPanel;
    btnUsuarios: TPanel;
    pnlNovoAtendimentoBorda: TPanel;
    btnNovoAtendimento: TPanel;
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
    lblUsuario: TLabel;
    lblAcao: TLabel;
    lblSecaoResultados: TLabel;
    shpLinhaResultados: TShape;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    cbxUsuario: TComboBox;
    cbxAcao: TComboBox;
    btnPesquisarLog: TPanel;
    pnlLimparFiltrosBorda: TPanel;
    btnLimparFiltros: TPanel;
    chkIncluirLogins: TCheckBox;
    lvLog: TDBGrid;
    QuerySql: TFDQuery;
    DataSource: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnNovoAtendimentoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlConteudoResize(Sender: TObject);
    procedure btnPesquisarLogClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
  private
    procedure buscarLog;
    procedure carregarUsuarios;
    procedure limparFiltros;
  public
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

uses
  uNavegacao, System.DateUtils, uConexao, uGrid, uUsuarioRepository;


procedure TfrmLog.btnPesquisarClick(Sender: TObject);
begin
  IrPara(Self, tlPesquisar);
end;

procedure TfrmLog.btnUsuariosClick(Sender: TObject);
begin
  IrPara(Self, tlUsuarios);
end;

procedure TfrmLog.btnNovoAtendimentoClick(Sender: TObject);
begin
  IrPara(Self, tlRegistrar);
end;

procedure TfrmLog.btnVoltarClick(Sender: TObject);
begin
  IrPara(Self, tlRegistrar);
end;

procedure TfrmLog.FormCreate(Sender: TObject);
begin
  QuerySql.Connection := Conexao;
end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
  carregarUsuarios;
  limparFiltros;
  buscarLog;
end;

procedure TfrmLog.pnlConteudoResize(Sender: TObject);
begin
  AjustarGrid(lvLog);
end;

procedure TfrmLog.btnPesquisarLogClick(Sender: TObject);
begin
  buscarLog;
end;

procedure TfrmLog.btnLimparFiltrosClick(Sender: TObject);
begin
  limparFiltros;
  buscarLog;
end;

procedure TfrmLog.buscarLog;
var
  usuario_id : Integer;
  acao : string;
begin
  usuario_id := Integer(cbxUsuario.Items.Objects[cbxUsuario.ItemIndex]);

  acao := '';

  if cbxAcao.ItemIndex > 0 then
    acao := cbxAcao.Text;

  QuerySql.SQL.Text := '''
    select *
    from logcomfiltro
    where (:usuario_id = 0 or usuario_id = :usuario_id)
      and (:acao = '' or Acao = :acao)
      and (:incluir_logins = 1 or Acao <> 'Login')
      and (:de is null or data >= :de)
      and (:ate is null or data < :ate)
    order by data desc
    ''';

  QuerySql.ParamByName('usuario_id').AsInteger := usuario_id;
  QuerySql.ParamByName('acao').AsString := acao;

  if chkIncluirLogins.Checked then
    QuerySql.ParamByName('incluir_logins').AsInteger := 1
  else
    QuerySql.ParamByName('incluir_logins').AsInteger := 0;

  QuerySql.ParamByName('de').DataType := ftDateTime;
  QuerySql.ParamByName('ate').DataType := ftDateTime;

  if dtpDe.Checked then
    QuerySql.ParamByName('de').AsDateTime := DateOf(dtpDe.Date)
  else
    QuerySql.ParamByName('de').Clear;

  if dtpAte.Checked then
    QuerySql.ParamByName('ate').AsDateTime := DateOf(dtpAte.Date) + 1
  else
    QuerySql.ParamByName('ate').Clear;

  QuerySql.Open;
  QuerySql.FieldByName('id').Visible := false;
  QuerySql.FieldByName('usuario_id').Visible := false;
  AjustarGrid(lvLog);
end;

procedure TfrmLog.carregarUsuarios;
var
  Usuarios : TStringList;
begin
  Usuarios := TUsuarioRepository.buscarListaUsuarios;
  try
    cbxUsuario.Items.Clear;
    cbxUsuario.Items.AddObject('Todos', TObject(0));
    cbxUsuario.Items.AddStrings(Usuarios);
  finally
    Usuarios.Free;
  end;
end;

procedure TfrmLog.limparFiltros;
begin
  dtpDe.Checked := false;
  dtpAte.Checked := false;
  cbxUsuario.ItemIndex := 0;
  cbxAcao.ItemIndex := 0;
  chkIncluirLogins.Checked := false;
end;

end.
