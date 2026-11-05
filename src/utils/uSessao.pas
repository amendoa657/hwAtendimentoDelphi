unit uSessao;

interface

uses System.Classes, uUsuario;

type
  TSessao = class
  public
    class var usuario : TUsuario;
    class var permissoes : TStringList;
    class procedure iniciarSessao(const usuarioLogado : TUsuario);
    class procedure encerrarSessao;
    class function temPermissao(const permissao : string) : Boolean;
  end;

implementation

uses uUsuarioRepository;

class procedure TSessao.iniciarSessao(const usuarioLogado : TUsuario);
begin
  encerrarSessao;

  usuario := usuarioLogado;
  permissoes := TUsuarioRepository.buscarPermissoesPorPerfil(usuario.perfil_id);
end;

class procedure TSessao.encerrarSessao;
begin
  usuario.Free;
  usuario := nil;

  permissoes.Free;
  permissoes := nil;
end;

class function TSessao.temPermissao(const permissao : string) : Boolean;
begin
  Result := (permissoes <> nil) and (permissoes.IndexOf(permissao) <> -1);
end;

initialization

finalization
  TSessao.encerrarSessao;

end.
