unit uAnexoRepository;

interface

uses FireDAC.Comp.Client;

type
  TAnexoRepository = class
  private
    class function tamanhoArquivo(const caminho : string) : Int64;
  public
    class function registrarAnexo(const atendimento_id, usuario_id : Integer; const caminho : string) : Integer;
    class function salvarAnexoEmArquivo(const id : Integer; const caminho : string) : Boolean;
    class function excluirAnexo(const id : Integer) : Boolean;
  end;


implementation

uses System.SysUtils, uConexao, FireDAC.stan.Param, Data.DB, Vcl.Dialogs;

class function TAnexoRepository.tamanhoArquivo(const caminho : string) : Int64;
  var
    Arquivo : TSearchRec;
  begin
    Result := 0;
    if FindFirst(caminho, faAnyFile, Arquivo) = 0 then
    begin
      Result := Arquivo.Size;
      FindClose(Arquivo);
    end;
  end;

class function TAnexoRepository.registrarAnexo(const atendimento_id, usuario_id : Integer; const caminho : string) : Integer;
  var
    Query: TFDQuery;
  begin
    Result := -1;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        insert into atendimento_anexo(
          atendimento_id,
          usuario_id,
          nome_arquivo,
          tamanho_bytes,
          conteudo
        )
        values(
          :atendimento_id,
          :usuario_id,
          :nome_arquivo,
          :tamanho_bytes,
          :conteudo
        )
        ''';
      Query.ParamByName('atendimento_id').AsInteger := atendimento_id;
      Query.ParamByName('usuario_id').AsInteger := usuario_id;
      Query.ParamByName('nome_arquivo').AsString := ExtractFileName(caminho);
      Query.ParamByName('tamanho_bytes').AsInteger := tamanhoArquivo(caminho);
      Query.ParamByName('conteudo').LoadFromFile(caminho, ftBlob);
      try
        Query.ExecSQL;
        Result := Conexao.GetLastAutoGenValue('');
      except
        on E: Exception do
          ShowMessage('Erro ao registrar anexo: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

class function TAnexoRepository.salvarAnexoEmArquivo(const id : Integer; const caminho : string) : Boolean;
  var
    Query: TFDQuery;
  begin
    Result := false;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        select
          conteudo
        from atendimento_anexo
        where
          id=:id;
        ''';
      Query.ParamByName('id').AsInteger := id;
      try
        Query.Open;

        if not Query.IsEmpty then
        begin
          TBlobField(Query.FieldByName('conteudo')).SaveToFile(caminho);
          Result := true;
        end;
      except
        on E: Exception do
          ShowMessage('Erro ao salvar anexo: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

class function TAnexoRepository.excluirAnexo(const id : Integer) : Boolean;
  var
    Query: TFDQuery;
  begin
    Result := false;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        delete from atendimento_anexo
        where
          id=:id
        ''';
      Query.ParamByName('id').AsInteger := id;
      try
        Query.ExecSQL;
        Result := true;
      except
        on E: Exception do
          ShowMessage('Erro ao excluir anexo: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

end.
