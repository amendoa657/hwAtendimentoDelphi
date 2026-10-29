unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    lblHello: TLabel;
    btnHello: TButton;
    procedure btnHelloClick(Sender: TObject);
    procedure btnHelloEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnHelloClick(Sender: TObject);
begin
  lblHello.Caption := 'Hello from HWatendimento';
end;

procedure TfrmMain.btnHelloEnter(Sender: TObject);
begin

end;

end.
