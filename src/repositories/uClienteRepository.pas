unit uClienteRepository;


interface

uses System.Generics.Collections, FireDAC.Comp.Client, uCliente;

type
  TClienteRepository = class
  private
    class function MontarCliente(Query: TFDQuery): TCliente;
  public
    class function BuscarPorNumeroSerie(const numeroSerie : string) : TCliente;
  end;


implementation

uses System.SysUtils, uConexao, FireDAC.stan.Param, Data.DB;

class function TClienteRepository.MontarCliente(Query: TFDQuery): TCliente;
  begin
    Result := TCliente.Create;
    Result.id       := Query.FieldByName('id').AsInteger;
    Result.tipo     := Query.FieldByName('tipo').AsString;
    Result.nome     := Query.FieldByName('nome').AsString;
    Result.telefone := Query.FieldByName('telefone').AsString;
    Result.nome_empresa  := Query.FieldByName('nome_empresa').AsString;
  end;

class function TClienteRepository.BuscarPorNumeroSerie(const numeroSerie: string): TCliente;
  var
    Query: TFDQuery;

  begin
    Result := nil;
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Conexao;
      Query.SQL.Text := '''
        select
          cliente.id as id,
          equipamento.id as idEquipamento,
          nome,
          tipo,
          nome_empresa,
          telefone
        from equipamento
          inner join cliente on equipamento.cliente_id=cliente.id
        where
        	numero_serie=:numero_serie;
        ''';
      Query.ParamByName('numero_serie').AsString := numeroSerie;
      Query.Open;

      if not Query.IsEmpty then
        Result := MontarCliente(Query);
    finally
      Query.Free;
    end;
  end;


end.
