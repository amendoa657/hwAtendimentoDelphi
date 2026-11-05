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
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TfrmPesquisarAtendimento = class(TForm)
    pnlCabecalho: TPanel;
    lblAppTitulo: TLabel;
    imgLogo: TImage;
    pnlNovoAtendimentoBorda: TPanel;
    btnNovoAtendimento: TPanel;
    pnlUsuariosBorda: TPanel;
    btnUsuarios: TPanel;
    pnlLogBorda: TPanel;
    btnLog: TPanel;
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
    btnEditar: TPanel;
    pnlExcluirBorda: TPanel;
    btnExcluir: TPanel;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QuerySql: TFDQuery;
    DataSource: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoAtendimentoClick(Sender: TObject);
    procedure buscarPorFiltro(const descricao, nome_cliente, numero_serie, telefone: string; const data_hora_inicio, data_hora_fim : TDateTime);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pnlConteudoResize(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  frmPesquisarAtendimento: TfrmPesquisarAtendimento;

implementation

{$R *.dfm}

uses uNavegacao, System.DateUtils, System.UITypes, uConexao, uGrid, editarAtendimento, uAtendimentoRepository, uAtendimento, uLogRepository, uSessao;

procedure TfrmPesquisarAtendimento.FormCreate(Sender: TObject);
begin
  pnlUsuariosBorda.Visible := TSessao.temPermissao('ver_usuarios');
  pnlLogBorda.Visible := TSessao.temPermissao('ver_log');
  pnlNovoAtendimentoBorda.Visible := TSessao.temPermissao('registrar_atendimento');

  btnEditar.Visible := TSessao.temPermissao('editar_atendimento') or TSessao.temPermissao('editar_proprio_atendimento');
  pnlExcluirBorda.Visible := TSessao.temPermissao('excluir_atendimento');

  QuerySql.Connection := Conexao;

end;

procedure TfrmPesquisarAtendimento.FormShow(Sender: TObject);
begin
  btnPesquisarClick(Self);
end;

procedure TfrmPesquisarAtendimento.btnNovoAtendimentoClick(Sender: TObject);
begin
  AbrirTela(Self, tlRegistrar);
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
  AjustarGrid(lvResultados);

end;

procedure TfrmPesquisarAtendimento.pnlConteudoResize(Sender: TObject);
begin
  AjustarGrid(lvResultados);
end;

procedure TfrmPesquisarAtendimento.btnUsuariosClick(Sender: TObject);
begin
  AbrirTela(Self, tlUsuarios);
end;

procedure TfrmPesquisarAtendimento.btnLogClick(Sender: TObject);
begin
  AbrirTela(Self, tlLog);
end;

procedure TfrmPesquisarAtendimento.btnEditarClick(Sender: TObject);
var frmEditar : TfrmEditarAtendimento;
begin
  if not QuerySql.Active or QuerySql.IsEmpty then
  begin
    ShowMessage('Pesquise e selecione um atendimento para editar.');
    Exit;
  end;

  if not TSessao.temPermissao('editar_atendimento') and
    (QuerySql.FieldByName('usuario_id').AsInteger <> TSessao.usuario.id) then
  begin
    ShowMessage('Você só pode editar atendimentos registrados por você.');
    Exit;
  end;

  frmEditar := TfrmEditarAtendimento.Create(Self);
  try
    if frmEditar.carregarAtendimento(
      QuerySql.FieldByName('id').AsInteger,
      QuerySql.FieldByName('numero_serie').AsString,
      QuerySql.FieldByName('modelo').AsString,
      QuerySql.FieldByName('Cliente').AsString,
      QuerySql.FieldByName('Telefone').AsString
    ) then
    begin
      if frmEditar.ShowModal = mrOk then
        btnPesquisarClick(Self);
    end;
  finally
    frmEditar.Free;
  end;
end;

procedure TfrmPesquisarAtendimento.btnExcluirClick(Sender: TObject);
var
  id : Integer;
  cliente_id : Integer;
  cliente : string;
  inicio : string;

  Atendimento : TAtendimento;
begin
  if not QuerySql.Active or QuerySql.IsEmpty then
  begin
    ShowMessage('Pesquise e selecione um atendimento para excluir.');
    Exit;
  end;

  id := QuerySql.FieldByName('id').AsInteger;
  cliente := QuerySql.FieldByName('Cliente').AsString;
  inicio := FormatDateTime('dd/mm/yyyy hh:nn', QuerySql.FieldByName('inicio').AsDateTime);

  if MessageDlg(
    'Excluir o atendimento de ' + cliente + ' (' + inicio + ')?' + sLineBreak + 'Essa ação não pode ser desfeita.',
    mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    Exit;

  cliente_id := 0;
  Atendimento := TAtendimentoRepository.buscarAtendimentoPorId(id);

  if Atendimento <> nil then
  begin
    cliente_id := Atendimento.cliente_id;
    Atendimento.Free;
  end;

  if TAtendimentoRepository.excluirAtendimento(id) then
  begin
    TLogRepository.registrarLog(
      TSessao.usuario.id,
      cliente_id,
      id,
      'Excluiu',
      'atendimento',
      'Excluiu o atendimento de ' + cliente + ' (' + inicio + ')'
    );

    ShowMessage('Atendimento excluído com sucesso!');
    btnPesquisarClick(Self);
  end;
end;

end.
