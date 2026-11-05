unit usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUsuarios = class(TForm)
    pnlCabecalho: TPanel;
    lblAppTitulo: TLabel;
    imgLogo: TImage;
    pnlPesquisarBorda: TPanel;
    btnPesquisar: TPanel;
    pnlLogBorda: TPanel;
    btnLog: TPanel;
    pnlNovoAtendimentoBorda: TPanel;
    btnNovoAtendimento: TPanel;
    pnlRodape: TPanel;
    shpLinhaRodape: TShape;
    pnlVoltarBorda: TPanel;
    btnVoltar: TPanel;
    pnlConteudo: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblSecaoCadastrados: TLabel;
    shpLinhaCadastrados: TShape;
    lvUsuarios: TDBGrid;
    pnlNovoUsuario: TPanel;
    lblSecaoNovoUsuario: TLabel;
    shpLinhaNovoUsuario: TShape;
    lblNome: TLabel;
    lblSenha: TLabel;
    lblPerfil: TLabel;
    edtNome: TEdit;
    edtSenha: TEdit;
    cbxPerfil: TComboBox;
    btnCadastrar: TPanel;
    btnAtivarDesativar: TPanel;
    QuerySql: TFDQuery;
    DataSource: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure btnNovoAtendimentoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlConteudoResize(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAtivarDesativarClick(Sender: TObject);
  private
    procedure buscarUsuarios;
    procedure carregarPerfis;
    procedure limparCampos;
  public
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses
  uNavegacao, System.UITypes, uConexao, uGrid, uValidacoes, uUsuario, uUsuarioRepository, uLogRepository, uSessao;


procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  IrPara(Self, tlPesquisar);
end;

procedure TfrmUsuarios.btnLogClick(Sender: TObject);
begin
  IrPara(Self, tlLog);
end;

procedure TfrmUsuarios.btnNovoAtendimentoClick(Sender: TObject);
begin
  IrPara(Self, tlRegistrar);
end;

procedure TfrmUsuarios.btnVoltarClick(Sender: TObject);
begin
  IrPara(Self, tlRegistrar);
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  QuerySql.Connection := Conexao;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  pnlNovoUsuario.Visible := TSessao.temPermissao('gerenciar_usuarios');
  btnAtivarDesativar.Visible := TSessao.temPermissao('gerenciar_usuarios');

  carregarPerfis;
  buscarUsuarios;
end;

procedure TfrmUsuarios.pnlConteudoResize(Sender: TObject);
begin
  AjustarGrid(lvUsuarios);
end;

procedure TfrmUsuarios.btnCadastrarClick(Sender: TObject);
var
  nome : string;
  senha : string;
  perfil_id : Integer;
  usuario_id : Integer;

  Usuario : TUsuario;
begin
  nome := edtNome.Text;
  senha := edtSenha.Text;

  if TValidacoes.ValidarUsuario(
      nome,
      senha,
      cbxPerfil.ItemIndex) then
  begin
    Usuario := TUsuarioRepository.buscarUsuarioPorNome(nome);

    if Usuario <> nil then
    begin
      Usuario.Free;
      ShowMessage('Já existe um usuário com esse nome.');
      Exit;
    end;

    perfil_id := Integer(cbxPerfil.Items.Objects[cbxPerfil.ItemIndex]);

    usuario_id := TUsuarioRepository.registrarUsuario(
      nome,
      senha,
      perfil_id
    );

    if usuario_id <> -1 then
    begin
      TLogRepository.registrarLog(
        TSessao.usuario.id,
        0,
        usuario_id,
        'Criou',
        'usuario',
        'Cadastrou o usuário ' + nome + ' (' + cbxPerfil.Text + ')'
      );

      ShowMessage('Usuário cadastrado com sucesso!');
      limparCampos;
      buscarUsuarios;
    end;
  end;
end;

procedure TfrmUsuarios.btnAtivarDesativarClick(Sender: TObject);
var
  id : Integer;
  nome : string;
  ativo : Boolean;
  acao : string;
begin
  if not QuerySql.Active or QuerySql.IsEmpty then
  begin
    ShowMessage('Selecione um usuário.');
    Exit;
  end;

  id := QuerySql.FieldByName('id').AsInteger;
  nome := QuerySql.FieldByName('Nome').AsString;
  ativo := QuerySql.FieldByName('Ativo').AsString = 'Sim';

  if ativo and (id = TSessao.usuario.id) then
  begin
    ShowMessage('Você não pode desativar o seu próprio usuário.');
    Exit;
  end;

  if ativo then
    acao := 'Desativar'
  else
    acao := 'Ativar';

  if MessageDlg(
    acao + ' o usuário ' + nome + '?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  if TUsuarioRepository.alterarAtivoUsuario(id, not ativo) then
  begin
    if ativo then
      acao := 'Desativou'
    else
      acao := 'Ativou';

    TLogRepository.registrarLog(
      TSessao.usuario.id,
      0,
      id,
      'Editou',
      'usuario',
      acao + ' o usuário ' + nome
    );

    buscarUsuarios;
  end;
end;

procedure TfrmUsuarios.buscarUsuarios;
begin
  QuerySql.SQL.Text := '''
    select
      usuario.id as id,
      usuario.nome as Nome,
      perfil.nome as Perfil,
      case when usuario.ativo = 1 then 'Sim' else 'Não' end as Ativo,
      usuario.criado_em as criado_em
    from usuario
      inner join perfil on usuario.perfil_id=perfil.id
    order by usuario.nome
    ''';
  QuerySql.Open;
  QuerySql.FieldByName('id').Visible := false;
  AjustarGrid(lvUsuarios);
end;

procedure TfrmUsuarios.carregarPerfis;
var
  Perfis : TStringList;
begin
  Perfis := TUsuarioRepository.buscarPerfis;
  try
    cbxPerfil.Items.Assign(Perfis);
  finally
    Perfis.Free;
  end;
end;

procedure TfrmUsuarios.limparCampos;
begin
  edtNome.Clear;
  edtSenha.Clear;
  cbxPerfil.ItemIndex := -1;
end;

end.
