unit uAtendimento;


interface
  type
    TAtendimento = class
    public
      id: Integer;
      equipamento_id : Integer;
      cliente_id : Integer;
      data_hora_inicio : TDateTime;
      data_hora_fim : TDateTime;
      descricao : string;
    end;

implementation

end.
