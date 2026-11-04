-- Correções na estrutura do banco hwatendimento.
-- Rodar uma vez, no MySQL Workbench, depois de fazer um backup (Server > Data Export).

USE hwatendimento;

-- 1. MyISAM não suporta chaves estrangeiras nem transações: troca para InnoDB
ALTER TABLE cliente     ENGINE = InnoDB;
ALTER TABLE equipamento ENGINE = InnoDB;
ALTER TABLE atendimento ENGINE = InnoDB;

-- 2. Chaves estrangeiras: o banco passa a recusar ids de cliente/equipamento que não existem.
--    Se der erro aqui, existe algum registro apontando para um id inexistente
--    (as consultas no final do arquivo mostram quais).
ALTER TABLE equipamento
  ADD CONSTRAINT fk_equipamento_cliente
  FOREIGN KEY (cliente_id) REFERENCES cliente (id);

ALTER TABLE atendimento
  ADD CONSTRAINT fk_atendimento_cliente
  FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  ADD CONSTRAINT fk_atendimento_equipamento
  FOREIGN KEY (equipamento_id) REFERENCES equipamento (id);

-- 3. Índice repetido: uq_cliente_telefone (UNIQUE) já serve como índice do telefone
ALTER TABLE cliente DROP INDEX ix_cliente_telefone;

-- 4. Duração calculava fim - fim (sempre 00:00). Agora é fim - início,
--    e mostra "Em aberto" quando o atendimento ainda não terminou.
CREATE OR REPLACE VIEW atendimentoscomfiltro AS
SELECT
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


-- Se o passo 2 der erro, estas consultas mostram os registros "órfãos":
--
-- SELECT * FROM equipamento WHERE cliente_id NOT IN (SELECT id FROM cliente);
-- SELECT * FROM atendimento WHERE cliente_id NOT IN (SELECT id FROM cliente);
-- SELECT * FROM atendimento WHERE equipamento_id NOT IN (SELECT id FROM equipamento);
