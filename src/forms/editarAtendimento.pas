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
    procedure btnSalvarClick(Sender: TObject);
  private
    var
      atendimento_id : Integer;
  public
    function carregarAtendimento(const id : Integer; const numero_serie, modelo, cliente, telefone : string) : Boolean;
  end;

var
  frmEditarAtendimento: TfrmEditarAtendimento;

implementation

{$R *.dfm}

uses System.DateUtils, System.UITypes, uAtendimento, uAtendimentoRepository, uValidacoes;

procedure TfrmEditarAtendimento.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditarAtendimento.btnSalvarClick(Sender: TObject);
var
  data_hora_inicio : TDateTime;
  data_hora_fim : TDateTime;
  descricao : string;
begin
  data_hora_inicio := DateOf(dtpInicioData.Date) + TimeOf(dtpInicioHora.Time);

  data_hora_fim := 0;

  if dtpTerminoData.Checked then
    data_hora_fim := DateOf(dtpTerminoData.Date) + TimeOf(dtpTerminoHora.Time);

  descricao := memDescricao.Text;

  if TValidacoes.ValidarEdicao(
      descricao,
      data_hora_inicio,
      data_hora_fim) then
  begin
    if TAtendimentoRepository.atualizarAtendimento(
      atendimento_id,
      data_hora_inicio,
      data_hora_fim,
      descricao
    ) then
    begin
      ShowMessage('Atendimento atualizado com sucesso!');
      ModalResult := mrOk;
    end;
  end;
end;

function TfrmEditarAtendimento.carregarAtendimento(const id : Integer; const numero_serie, modelo, cliente, telefone : string) : Boolean;
var
  Atendimento : TAtendimento;
begin
  Result := false;
  atendimento_id := id;

  lblNumeroSerieValor.Caption := numero_serie;
  lblModeloValor.Caption := modelo;
  lblClienteValor.Caption := cliente;
  lblTelefoneValor.Caption := telefone;

  Atendimento := TAtendimentoRepository.buscarAtendimentoPorId(id);

  if Atendimento = nil then
  begin
    ShowMessage('Atendimento não encontrado.');
    Exit;
  end;

  try
    dtpInicioData.Date := DateOf(Atendimento.data_hora_inicio);
    dtpInicioHora.Time := TimeOf(Atendimento.data_hora_inicio);

    if Atendimento.data_hora_fim = 0 then
      dtpTerminoData.Checked := false
    else
    begin
      dtpTerminoData.Date := DateOf(Atendimento.data_hora_fim);
      dtpTerminoHora.Time := TimeOf(Atendimento.data_hora_fim);
      dtpTerminoData.Checked := true;
    end;

    memDescricao.Text := Atendimento.descricao;
    Result := true;
  finally
    Atendimento.Free;
  end;
end;

end.
