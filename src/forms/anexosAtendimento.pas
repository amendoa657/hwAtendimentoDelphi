unit anexosAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAnexosAtendimento = class(TForm)
    lblTitulo: TLabel;
    lblAtendimento: TLabel;
    lvAnexos: TDBGrid;
    pnlRodape: TPanel;
    shpLinhaRodape: TShape;
    btnAbrirAnexo: TPanel;
    pnlSalvarAnexoBorda: TPanel;
    btnSalvarAnexo: TPanel;
    pnlFecharBorda: TPanel;
    btnFechar: TPanel;
    QueryAnexos: TFDQuery;
    dsAnexos: TDataSource;
    dlgSalvarAnexo: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure btnAbrirAnexoClick(Sender: TObject);
    procedure btnSalvarAnexoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
  public
    procedure carregarAnexos(const atendimento_id : Integer; const cliente, inicio : string);
  end;

var
  frmAnexosAtendimento: TfrmAnexosAtendimento;

implementation

{$R *.dfm}

uses uConexao, uGrid, uArquivo, uAnexoRepository;

procedure TfrmAnexosAtendimento.FormShow(Sender: TObject);
begin
  AjustarGrid(lvAnexos);
end;

procedure TfrmAnexosAtendimento.carregarAnexos(const atendimento_id : Integer; const cliente, inicio : string);
begin
  QueryAnexos.Connection := Conexao;
  QueryAnexos.SQL.Text := '''
    select
      atendimento_anexo.id as id,
      atendimento_anexo.nome_arquivo as Arquivo,
      concat(round(atendimento_anexo.tamanho_bytes / 1024), ' KB') as Tamanho,
      usuario.nome as Usuario,
      atendimento_anexo.criado_em as criado_em
    from atendimento_anexo
      inner join usuario on usuario.id=atendimento_anexo.usuario_id
    where
      atendimento_anexo.atendimento_id=:atendimento_id
    order by atendimento_anexo.criado_em
    ''';
  QueryAnexos.ParamByName('atendimento_id').AsInteger := atendimento_id;
  QueryAnexos.Open;
  QueryAnexos.FieldByName('id').Visible := false;

  if QueryAnexos.IsEmpty then
    lblAtendimento.Caption := cliente + ' - ' + inicio + ' (nenhum anexo)'
  else
    lblAtendimento.Caption := cliente + ' - ' + inicio;
end;

procedure TfrmAnexosAtendimento.btnAbrirAnexoClick(Sender: TObject);
var
  id : Integer;
  caminho : string;
begin
  if QueryAnexos.IsEmpty then
  begin
    ShowMessage('Selecione um anexo.');
    Exit;
  end;

  id := QueryAnexos.FieldByName('id').AsInteger;
  caminho := TArquivo.caminhoTemporario(QueryAnexos.FieldByName('Arquivo').AsString);

  if TAnexoRepository.salvarAnexoEmArquivo(id, caminho) then
    TArquivo.abrir(caminho);
end;

procedure TfrmAnexosAtendimento.btnSalvarAnexoClick(Sender: TObject);
var
  id : Integer;
begin
  if QueryAnexos.IsEmpty then
  begin
    ShowMessage('Selecione um anexo.');
    Exit;
  end;

  id := QueryAnexos.FieldByName('id').AsInteger;
  dlgSalvarAnexo.FileName := QueryAnexos.FieldByName('Arquivo').AsString;

  if not dlgSalvarAnexo.Execute then
    Exit;

  if TAnexoRepository.salvarAnexoEmArquivo(id, dlgSalvarAnexo.FileName) then
    ShowMessage('Arquivo salvo com sucesso!');
end;

procedure TfrmAnexosAtendimento.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
