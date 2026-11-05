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
    class function buscarUsuarioPorNome(const nome : string) : TUsuario;
    class function buscarPerfis : TStringList;
    class function registrarUsuario(const nome, senha : string; const perfil_id : Integer) : Integer;
    class function alterarAtivoUsuario(const id : Integer; const ativo : Boolean) : Boolean;
  end;


implementation

uses System.SysUtils, uConexao, FireDAC.stan.Param, Data.DB, Vcl.Dialogs, uSenha;

class function TUsuarioRepository.MontarUsuario(Query: TFDQuery): TUsuario;
  begin
    Result := TUsuario.Create;
    Result.id        := Query.FieldByName('id').AsInteger;
    Result.nome      := Query.FieldByName('nome').AsString;
    Result.perfil_id := Query.FieldByName('perfil_id').AsInteger;
    Result.perfil    := Query.FieldByName('perfil').AsString;
    Result.ativo     := Query.FieldByName('ativo').AsBoolean;
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

class function TUsuarioRepository.buscarUsuarioPorNome(const nome : string) : TUsuario;
  var
    Query: TFDQuery;
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
          usuario.ativo as ativo
        from usuario
          inner join perfil on usuario.perfil_id=perfil.id
        where
          usuario.nome=:nome;
        ''';
      Query.ParamByName('nome').AsString := nome;
      Query.Open;

      if not Query.IsEmpty then
        Result := MontarUsuario(Query);
    finally
      Query.Free;
    end;
  end;

class function TUsuarioRepository.buscarPerfis : TStringList;
  var
    Query: TFDQuery;
  begin
    Result := TStringList.Create;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        select
          id,
          nome
        from perfil
        order by id;
        ''';
      Query.Open;

      while not Query.Eof do
      begin
        Result.AddObject(Query.FieldByName('nome').AsString, TObject(Query.FieldByName('id').AsInteger));
        Query.Next;
      end;
    finally
      Query.Free;
    end;
  end;

class function TUsuarioRepository.registrarUsuario(const nome, senha : string; const perfil_id : Integer) : Integer;
  var
    Query: TFDQuery;
    senha_salt : string;
  begin
    Result := -1;
    senha_salt := TSenha.gerarSalt;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        insert into usuario(
          nome,
          senha_hash,
          senha_salt,
          perfil_id
        )
        values(
          :nome,
          :senha_hash,
          :senha_salt,
          :perfil_id
        )
        ''';
      Query.ParamByName('nome').AsString := nome;
      Query.ParamByName('senha_hash').AsString := TSenha.gerarHash(senha_salt, senha);
      Query.ParamByName('senha_salt').AsString := senha_salt;
      Query.ParamByName('perfil_id').AsInteger := perfil_id;
      try
        Query.ExecSQL;
        Result := Conexao.GetLastAutoGenValue('');
      except
        on E: Exception do
          ShowMessage('Erro ao registrar usuario: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

class function TUsuarioRepository.alterarAtivoUsuario(const id : Integer; const ativo : Boolean) : Boolean;
  var
    Query: TFDQuery;
  begin
    Result := false;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        update usuario set
          ativo = :ativo
        where
          id=:id
        ''';
      Query.ParamByName('id').AsInteger := id;
      Query.ParamByName('ativo').AsBoolean := ativo;
      try
        Query.ExecSQL;
        Result := true;
      except
        on E: Exception do
          ShowMessage('Erro ao alterar usuario: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

end.
