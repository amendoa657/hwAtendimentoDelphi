unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmLogin = class(TForm)
    pnlTopo: TPanel;
    lblAppTitulo: TLabel;
    pnlLogo: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblErroLogin: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TPanel;
  private
  public
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

end.
