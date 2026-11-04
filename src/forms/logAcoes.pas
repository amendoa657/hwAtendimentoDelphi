unit logAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage;

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
    lvLog: TDBGrid;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnNovoAtendimentoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
  public
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

uses
  uNavegacao;


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

end.
