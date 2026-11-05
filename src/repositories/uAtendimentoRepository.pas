unit uAtendimentoRepository;

interface

uses System.Generics.Collections, FireDAC.Comp.Client, uAtendimento;

type
  TAtendimentoRepository = class
  private
    class function MontarAtendimento(Query: TFDQuery): TAtendimento;
  public
    class function registrarAtendimento(const data_hora_inicio, data_hora_fim : TDateTime ; const descricao : string; const cliente_id, equipamento_id, usuario_id : Integer) : Integer;
    class function buscarAtendimentoPorId(const id : Integer) : TAtendimento;
    class function atualizarAtendimento(const id : Integer; const data_hora_inicio, data_hora_fim : TDateTime; const descricao : string; const usuario_id : Integer) : Boolean;
    class function excluirAtendimento(const id : Integer) : Boolean;
  end;


implementation

uses System.SysUtils, uConexao, FireDAC.stan.Param, Data.DB, Vcl.Dialogs;

class function TAtendimentoRepository.MontarAtendimento(Query: TFDQuery): TAtendimento;
  begin
    Result := TAtendimento.Create;
    Result.id       := Query.FieldByName('id').AsInteger;
    Result.equipamento_id     := Query.FieldByName('equipamento_id').AsInteger;
    Result.cliente_id     := Query.FieldByName('cliente_id').AsInteger;
    Result.data_hora_inicio := Query.FieldByName('data_hora_inicio').AsDateTime;
    Result.data_hora_fim  := Query.FieldByName('data_hora_fim').AsDateTime;
    Result.descricao  := Query.FieldByName('descricao').AsString;
  end;


class function TAtendimentoRepository.registrarAtendimento(const data_hora_inicio, data_hora_fim : TDateTime ; const descricao : string; const cliente_id, equipamento_id, usuario_id : Integer) : Integer;
  var
    Query: TFDQuery;
  begin
    Result := -1;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        insert into atendimento(
          cliente_id,
          equipamento_id,
          usuario_id,
          data_hora_inicio,
          data_hora_fim,
          descricao
        )
        values(
          :cliente_id,
          :equipamento_id,
          :usuario_id,
          :data_hora_inicio,
          :data_hora_fim,
          :descricao
        )
        ''';
      Query.ParamByName('cliente_id').AsInteger := cliente_id;
      Query.ParamByName('equipamento_id').AsInteger := equipamento_id;
      Query.ParamByName('usuario_id').AsInteger := usuario_id;
      Query.ParamByName('data_hora_inicio').AsDateTime := data_hora_inicio;

      if data_hora_fim = 0 then
      begin
        Query.ParamByName('data_hora_fim').DataType := ftDateTime;
        Query.ParamByName('data_hora_fim').Clear;
      end
      else
        Query.ParamByName('data_hora_fim').AsDateTime := data_hora_fim;

      Query.ParamByName('descricao').AsString := descricao;
      try
        Query.ExecSQL;
        Result := Conexao.GetLastAutoGenValue('');
      except
        on E: Exception do
          ShowMessage('Erro ao registrar atendimento: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

class function TAtendimentoRepository.buscarAtendimentoPorId(const id : Integer) : TAtendimento;
  var
    Query: TFDQuery;
  begin
    Result := nil;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        select
          id,
          equipamento_id,
          cliente_id,
          data_hora_inicio,
          data_hora_fim,
          descricao
        from atendimento
        where
          id=:id;
        ''';
      Query.ParamByName('id').AsInteger := id;
      Query.Open;

      if not Query.IsEmpty then
        Result := MontarAtendimento(Query);
    finally
      Query.Free;
    end;
  end;

class function TAtendimentoRepository.atualizarAtendimento(const id : Integer; const data_hora_inicio, data_hora_fim : TDateTime; const descricao : string; const usuario_id : Integer) : Boolean;
  var
    Query: TFDQuery;
  begin
    Result := false;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        update atendimento set
          data_hora_inicio = :data_hora_inicio,
          data_hora_fim = :data_hora_fim,
          descricao = :descricao
        where
          id=:id
          and (:usuario_id = 0 or usuario_id = :usuario_id)
        ''';
      Query.ParamByName('id').AsInteger := id;
      Query.ParamByName('usuario_id').AsInteger := usuario_id;
      Query.ParamByName('data_hora_inicio').AsDateTime := data_hora_inicio;

      if data_hora_fim = 0 then
      begin
        Query.ParamByName('data_hora_fim').DataType := ftDateTime;
        Query.ParamByName('data_hora_fim').Clear;
      end
      else
        Query.ParamByName('data_hora_fim').AsDateTime := data_hora_fim;

      Query.ParamByName('descricao').AsString := descricao;
      try
        Query.ExecSQL;
        Result := true;
      except
        on E: Exception do
          ShowMessage('Erro ao atualizar atendimento: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

class function TAtendimentoRepository.excluirAtendimento(const id : Integer) : Boolean;
  var
    Query: TFDQuery;
  begin
    Result := false;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        delete from atendimento
        where
          id=:id
        ''';
      Query.ParamByName('id').AsInteger := id;
      try
        Query.ExecSQL;
        Result := true;
      except
        on E: Exception do
          ShowMessage('Erro ao excluir atendimento: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;

end.
