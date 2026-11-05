unit uLogRepository;

interface

type
  TLogRepository = class
  public
    class function registrarLog(const usuario_id, cliente_id, registro_id : Integer; const acao, tabela, detalhe : string) : Integer;
  end;

implementation

uses System.SysUtils, Data.DB, FireDAC.Comp.Client, FireDAC.stan.Param, Vcl.Dialogs, uConexao, System.StrUtils;

class function TLogRepository.registrarLog(const usuario_id, cliente_id, registro_id: Integer; const acao, tabela, detalhe: string): Integer;
  var
    Query: TFDQuery;
  begin

    Result := -1;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        insert into log(
          usuario_id,
          cliente_id,
          acao,
          tabela,
          registro_id,
          detalhe
        )
        values(
          :usuario_id,
          :cliente_id,
          :acao,
          :tabela,
          :registro_id,
          :detalhe
        )
        ''';
      Query.ParamByName('usuario_id').AsInteger := usuario_id;

      if cliente_id = 0 then
      begin
        Query.ParamByName('cliente_id').DataType := ftInteger;
        Query.ParamByName('cliente_id').Clear;
      end
      else
        Query.ParamByName('cliente_id').AsInteger := cliente_id;

      Query.ParamByName('registro_id').AsInteger := registro_id;
      Query.ParamByName('acao').AsString := acao;
      Query.ParamByName('tabela').AsString := tabela;
      Query.ParamByName('detalhe').AsString := detalhe;
      try
        Query.ExecSQL;
        Result := Conexao.GetLastAutoGenValue('');
      except
        on E: Exception do
          ShowMessage('Erro ao registrar log: ' + E.Message);

      end;
    finally
      Query.Free;
    end;
  end;

end.


                   {

    }