unit uUsuarioRepository;

interface

uses System.Classes, FireDAC.Comp.Client, uUsuario;

type
  TUsuarioRepository = class
  private
    class function MontarUsuario(Query: TFDQuery): TUsuario;
  public
    class function autenticarUsuario(const nome, senha : string) : TUsuario;
    class function buscarPermissoesPorPerfil(const perfil_id : Integer) : TStringList;
  end;


implementation

uses System.SysUtils, uConexao, FireDAC.stan.Param, Data.DB, uSenha;

class function TUsuarioRepository.MontarUsuario(Query: TFDQuery): TUsuario;
  begin
    Result := TUsuario.Create;
    Result.id        := Query.FieldByName('id').AsInteger;
    Result.nome      := Query.FieldByName('nome').AsString;
    Result.perfil_id := Query.FieldByName('perfil_id').AsInteger;
    Result.perfil    := Query.FieldByName('perfil').AsString;
    Result.ativo     := Query.FieldByName('ativo').AsInteger = 1;
  end;

class function TUsuarioRepository.autenticarUsuario(const nome, senha : string) : TUsuario;
  var
    Query: TFDQuery;
    senha_hash : string;
    senha_salt : string;
  begin
    Result := nil;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        select
          usuario.id as id,
          usuario.nome as nome,
          usuario.perfil_id as perfil_id,
          perfil.nome as perfil,
          usuario.ativo as ativo,
          usuario.senha_hash as senha_hash,
          usuario.senha_salt as senha_salt
        from usuario
          inner join perfil on usuario.perfil_id=perfil.id
        where
          usuario.nome=:nome
          and usuario.ativo=1;
        ''';
      Query.ParamByName('nome').AsString := nome;
      Query.Open;

      if not Query.IsEmpty then
      begin
        senha_hash := Query.FieldByName('senha_hash').AsString;
        senha_salt := Query.FieldByName('senha_salt').AsString;

        if TSenha.gerarHash(senha_salt, senha) = senha_hash then
          Result := MontarUsuario(Query);
      end;
    finally
      Query.Free;
    end;
  end;

class function TUsuarioRepository.buscarPermissoesPorPerfil(const perfil_id : Integer) : TStringList;
  var
    Query: TFDQuery;
  begin
    Result := TStringList.Create;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        select
          permissao
        from perfil_permissao
        where
          perfil_id=:perfil_id;
        ''';
      Query.ParamByName('perfil_id').AsInteger := perfil_id;
      Query.Open;

      while not Query.Eof do
      begin
        Result.Add(Query.FieldByName('permissao').AsString);
        Query.Next;
      end;
    finally
      Query.Free;
    end;
  end;

end.
