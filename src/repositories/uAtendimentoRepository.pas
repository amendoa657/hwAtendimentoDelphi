unit uAtendimentoRepository;

interface

uses System.Generics.Collections, FireDAC.Comp.Client, uAtendimento;

type
  TAtendimentoRepository = class
  private
    class function MontarAtendimento(Query: TFDQuery): TAtendimento;
  public
    class function registrarAtendimento(const data_hora_inicio, data_hora_fim : TDateTime ; const descricao : string; const cliente_id, equipamento_id : Integer) : Integer;
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


class function TAtendimentoRepository.registrarAtendimento(const data_hora_inicio, data_hora_fim : TDateTime ; const descricao : string; const cliente_id, equipamento_id : Integer) : Integer;
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
          data_hora_inicio,
          data_hora_fim,
          descricao
        )
        values(
          :cliente_id,
          :equipamento_id,
          :data_hora_inicio,
          :data_hora_fim,
          :descricao
        )
        ''';
      Query.ParamByName('cliente_id').AsInteger := cliente_id;
      Query.ParamByName('equipamento_id').AsInteger := equipamento_id;
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

end.
