unit uArquivo;

interface

type
  TArquivo = class
  public
    class function caminhoTemporario(const nome_arquivo : string) : string;
    class procedure abrir(const caminho : string);
  end;

implementation

uses System.SysUtils, System.IOUtils, Winapi.Windows, Winapi.ShellAPI;

class function TArquivo.caminhoTemporario(const nome_arquivo : string) : string;
begin
  // data e hora na frente do nome para nao conflitar com um arquivo aberto antes
  Result := TPath.Combine(TPath.GetTempPath, FormatDateTime('yyyymmddhhnnsszzz', Now) + '_' + nome_arquivo);
end;

class procedure TArquivo.abrir(const caminho : string);
begin
  // abre com o programa padrao do Windows para aquele tipo de arquivo
  ShellExecute(0, 'open', PChar(caminho), nil, nil, SW_SHOWNORMAL);
end;

end.
