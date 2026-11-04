-- A tela de pesquisa precisa do id do atendimento para editar e excluir.
-- Recria a view atendimentoscomfiltro com o id na primeira coluna
-- (já inclui a correção da duração do 001_correcoes.sql).

USE hwatendimento;

CREATE OR REPLACE VIEW atendimentoscomfiltro AS
SELECT
  atendimento.id               AS id,
  atendimento.data_hora_inicio AS inicio,
  equipamento.modelo           AS modelo,
  equipamento.numero_serie     AS numero_serie,
  cliente.nome                 AS Cliente,
  cliente.telefone             AS Telefone,
  CASE
    WHEN atendimento.data_hora_fim IS NULL THEN 'Em aberto'
    ELSE TIME_FORMAT(TIMEDIFF(atendimento.data_hora_fim, atendimento.data_hora_inicio), '%H:%i')
  END                          AS duracao,
  atendimento.descricao        AS descricao
FROM cliente
JOIN atendimento ON atendimento.cliente_id = cliente.id
JOIN equipamento ON equipamento.id = atendimento.equipamento_id;
