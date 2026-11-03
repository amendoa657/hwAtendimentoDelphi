unit uEquipamentoRepository;

interface

uses System.Generics.Collections, FireDAC.Comp.Client, uEquipamento;

type
  TEquipamentoRepository = class
  private
    class function MontarEquipamento(Query: TFDQuery): TEquipamento;
  public
    class function registrarEquipamento(const modelo, numero_serie : string; const cliente_id : Integer) : Integer;
  end;


implementation

uses System.SysUtils, uConexao, FireDAC.stan.Param, Data.DB, Vcl.Dialogs;

class function TEquipamentoRepository.MontarEquipamento(Query: TFDQuery): TEquipamento;
  begin
    Result := TEquipamento.Create;
    Result.id           := Query.FieldByName('id').AsInteger;
    Result.modelo       := Query.FieldByName('modelo').AsString;
    Result.numero_serie := Query.FieldByName('numero_serie').AsString;
    Result.cliente_id   := Query.FieldByName('cliente_id').AsInteger;
  end;


class function TEquipamentoRepository.registrarEquipamento(const modelo, numero_serie : string; const cliente_id : Integer) : Integer;
  var
    Query: TFDQuery;
  begin
    Result := -1;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        insert into equipamento(
          modelo,
          numero_serie,
          cliente_id
        )
        values(
          :modelo,
          :numero_serie,
          :cliente_id
        )
        ''';
      Query.ParamByName('modelo').AsString := modelo;
      Query.ParamByName('numero_serie').AsString := numero_serie;
      Query.ParamByName('cliente_id').AsInteger := cliente_id;
      try
        Query.ExecSQL;
        Result := Conexao.GetLastAutoGenValue('');
      except
        on E: Exception do
          ShowMessage('Erro ao registrar equipamento: ' + E.Message);

      end;

    finally
      Query.Free;
    end;
  end;



end.
