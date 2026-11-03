unit pesquisarAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmPesquisarAtendimento = class(TForm)
    pnlCabecalho: TPanel;
    lblAppTitulo: TLabel;
    pnlLogo: TPanel;
    pnlNovoAtendimentoBorda: TPanel;
    btnNovoAtendimento: TPanel;
    pnlUsuariosBorda: TPanel;
    btnUsuarios: TPanel;
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
    lvResultados: TListView;
  private
  public
  end;

var
  frmPesquisarAtendimento: TfrmPesquisarAtendimento;

implementation

{$R *.dfm}

end.
