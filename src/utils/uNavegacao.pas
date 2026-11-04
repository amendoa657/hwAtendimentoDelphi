unit uNavegacao;

interface

uses
  Vcl.Forms;

type
  TTela = (tlNenhuma, tlRegistrar, tlPesquisar, tlUsuarios, tlLog);

// Usado pela tela de registro (a principal): esconde ela e abre a tela pedida.
// Se essa tela pedir outra com IrPara, abre a próxima, até voltar para o registro.
procedure AbrirTela(APrincipal: TForm; ATela: TTela);

// Usado pelas outras telas: fecha a tela atual e diz qual abrir em seguida.
procedure IrPara(AAtual: TForm; ATela: TTela);

implementation

uses
  pesquisarAtendimento, usuarios, logAcoes;

var
  ProximaTela: TTela = tlNenhuma;

function CriarTela(ATela: TTela): TForm;
begin
  case ATela of
    tlPesquisar: Result := TfrmPesquisarAtendimento.Create(nil);
    tlUsuarios:  Result := TfrmUsuarios.Create(nil);
    tlLog:       Result := TfrmLog.Create(nil);
  else
    Result := nil;
  end;
end;

procedure AbrirTela(APrincipal: TForm; ATela: TTela);
var
  Tela: TForm;
begin
  APrincipal.Hide;
  try
    // uma tela por vez: quando uma fecha pedindo outra, abre a outra
    while not (ATela in [tlNenhuma, tlRegistrar]) do
    begin
      ProximaTela := tlNenhuma;
      Tela := CriarTela(ATela);
      try
        Tela.ShowModal;
      finally
        Tela.Free;
      end;
      ATela := ProximaTela;
    end;
  finally
    APrincipal.Show;
  end;
end;

procedure IrPara(AAtual: TForm; ATela: TTela);
begin
  ProximaTela := ATela;
  AAtual.Close;
end;

end.
