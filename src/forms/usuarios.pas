unit usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmUsuarios = class(TForm)
    pnlCabecalho: TPanel;
    lblAppTitulo: TLabel;
    pnlLogo: TPanel;
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
    lblSecaoNovoUsuario: TLabel;
    shpLinhaNovoUsuario: TShape;
    lblNome: TLabel;
    lblSenha: TLabel;
    lvUsuarios: TListView;
    btnAtivarDesativar: TPanel;
    edtNome: TEdit;
    edtSenha: TEdit;
    chkAdministrador: TCheckBox;
    btnCadastrar: TPanel;
  private
  public
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

end.
