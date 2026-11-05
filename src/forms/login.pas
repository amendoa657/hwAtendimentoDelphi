unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.UITypes, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    pnlTopo: TPanel;
    lblAppTitulo: TLabel;
    imgLogo: TImage;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblErroLogin: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TPanel;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uValidacoes, uUsuario, uUsuarioRepository, uSessao, uLogRepository;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  nome : string;
  senha : string;

  Usuario : TUsuario;
begin
  nome := edtUsuario.Text;
  senha := edtSenha.Text;

  lblErroLogin.Visible := false;

  if TValidacoes.ValidarLogin(
      nome,
      senha) then
  begin
    Usuario := TUsuarioRepository.autenticarUsuario(nome, senha);

    if Usuario <> nil then
    begin
      TSessao.iniciarSessao(Usuario);

      TLogRepository.registrarLog(
        Usuario.id,
        0,
        Usuario.id,
        'Login',
        'usuario',
        'Entrou no sistema'
      );

      ModalResult := mrOk;
    end
    else
    begin
      lblErroLogin.Visible := true;
      edtSenha.Clear;
      edtSenha.SetFocus;
    end;
  end;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // Enter funciona como clicar em Entrar
  if Key = #13 then
  begin
    Key := #0;
    btnEntrarClick(btnEntrar);
  end;
end;

end.
