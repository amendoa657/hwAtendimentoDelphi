unit editarAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmEditarAtendimento = class(TForm)
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblSecaoEquipamento: TLabel;
    shpLinhaEquipamento: TShape;
    lblNumeroSerie: TLabel;
    lblNumeroSerieValor: TLabel;
    lblModelo: TLabel;
    lblModeloValor: TLabel;
    lblCliente: TLabel;
    lblClienteValor: TLabel;
    lblTelefone: TLabel;
    lblTelefoneValor: TLabel;
    lblSecaoAtendimento: TLabel;
    shpLinhaAtendimento: TShape;
    lblInicio: TLabel;
    lblTermino: TLabel;
    lblDescricao: TLabel;
    dtpInicioData: TDateTimePicker;
    dtpInicioHora: TDateTimePicker;
    dtpTerminoData: TDateTimePicker;
    dtpTerminoHora: TDateTimePicker;
    memDescricao: TMemo;
    pnlRodape: TPanel;
    shpLinhaRodape: TShape;
    pnlCancelarBorda: TPanel;
    btnCancelar: TPanel;
    btnSalvar: TPanel;
    procedure btnCancelarClick(Sender: TObject);
  private
  public
  end;

var
  frmEditarAtendimento: TfrmEditarAtendimento;

implementation

{$R *.dfm}

procedure TfrmEditarAtendimento.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
