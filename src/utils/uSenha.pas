unit uSenha;

interface

type
  TSenha = class
  public
    class function gerarSalt : string;
    class function gerarHash(const salt, senha : string) : string;
  end;

implementation

uses System.SysUtils, System.Hash;

class function TSenha.gerarSalt : string;
begin
  // GUID sem chaves e tracos: 32 caracteres hexadecimais aleatorios
  Result := GUIDToString(TGUID.NewGuid);
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := LowerCase(Result);
end;

class function TSenha.gerarHash(const salt, senha : string) : string;
begin
  // mesmo calculo do banco: SHA2(CONCAT(salt, senha), 256)
  Result := THashSHA2.GetHashString(salt + senha);
end;

end.
