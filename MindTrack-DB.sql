------------------------------------------------------------
-- 1. TABELA DE COLABORADORES
------------------------------------------------------------
CREATE TABLE TB_COLABORADOR (
    ID_COLABORADOR NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NOME VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100) UNIQUE NOT NULL,
    CARGO VARCHAR2(50),
    CHECK (LENGTH(EMAIL) > 5)
);

------------------------------------------------------------
-- 2. TABELA DE CHECK-INS DE HUMOR
------------------------------------------------------------
CREATE TABLE TB_CHECKIN (
    ID_CHECKIN NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_COLABORADOR NUMBER NOT NULL,
    DATA_REGISTRO DATE DEFAULT SYSDATE NOT NULL,
    HUMOR VARCHAR2(50) NOT NULL,
    COMENTARIO VARCHAR2(255),
    CONSTRAINT FK_CHECKIN_COLAB FOREIGN KEY (ID_COLABORADOR)
        REFERENCES TB_COLABORADOR(ID_COLABORADOR)
);

------------------------------------------------------------
-- 3. TABELA DE RELATÓRIOS
------------------------------------------------------------
CREATE TABLE TB_RELATORIO (
    ID_RELATORIO NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_COLABORADOR NUMBER NOT NULL,
    DATA_GERACAO DATE DEFAULT SYSDATE NOT NULL,
    MEDIA_HUMOR NUMBER(4,2) CHECK (MEDIA_HUMOR BETWEEN 0 AND 10),
    RESUMO VARCHAR2(300),
    CONSTRAINT FK_RELATORIO_COLAB FOREIGN KEY (ID_COLABORADOR)
        REFERENCES TB_COLABORADOR(ID_COLABORADOR)
);

------------------------------------------------------------
-- 4. TABELA DE ALERTAS
------------------------------------------------------------
CREATE TABLE TB_ALERTA (
    ID_ALERTA NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_COLABORADOR NUMBER NOT NULL,
    TIPO_ALERTA VARCHAR2(80) NOT NULL,
    DESCRICAO VARCHAR2(255),
    DATA_ENVIO TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT FK_ALERTA_COLAB FOREIGN KEY (ID_COLABORADOR)
        REFERENCES TB_COLABORADOR(ID_COLABORADOR)
);



-- CHECKs adicionais
ALTER TABLE TB_COLABORADOR
  ADD CONSTRAINT CK_COLAB_EMAIL_ARROBA CHECK (INSTR(EMAIL,'@') > 0 AND LENGTH(EMAIL) > 5);

ALTER TABLE TB_CHECKIN
  ADD CONSTRAINT CK_CHECKIN_HUMOR
  CHECK (HUMOR IN ('Feliz','Motivado','Tranquilo','Neutro','Cansado','Estressado'));

ALTER TABLE TB_ALERTA
  ADD CONSTRAINT CK_ALERTA_TIPO
  CHECK (TIPO_ALERTA IN ('Informativo','Atenção','Crítico','Aviso'));

-- Índices nas FKs (performance)
CREATE INDEX IDX_CHECKIN_COLAB   ON TB_CHECKIN   (ID_COLABORADOR);
CREATE INDEX IDX_RELATORIO_COLAB ON TB_RELATORIO (ID_COLABORADOR);
CREATE INDEX IDX_ALERTA_COLAB    ON TB_ALERTA    (ID_COLABORADOR);

------------------------------------------------------------
----------------------POPULAR TABELAS----------------------- 
------------------------------------------------------------

-- COLABORADORES
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Ana Souza', 'ana.souza@mindtrack.com', 'Analista');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Pedro Duarte', 'pedro.duarte@mindtrack.com', 'Desenvolvedor');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Guilherme Martins', 'guilherme.martins@mindtrack.com', 'Gestor de Projetos');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Carla Menezes', 'carla.menezes@mindtrack.com', 'Psicóloga');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Lucas Ribeiro', 'lucas.ribeiro@mindtrack.com', 'Designer');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Mariana Silva', 'mariana.silva@mindtrack.com', 'RH');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Rafael Lima', 'rafael.lima@mindtrack.com', 'Analista');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Isabela Costa', 'isabela.costa@mindtrack.com', 'DevOps');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('João Pereira', 'joao.pereira@mindtrack.com', 'Desenvolvedor');
INSERT INTO TB_COLABORADOR (NOME, EMAIL, CARGO) VALUES ('Beatriz Rocha', 'beatriz.rocha@mindtrack.com', 'Analista de Dados');

------------------------------------------------------------
-- CHECKINS
------------------------------------------------------------
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (1, 'Feliz', 'Dia produtivo e tranquilo');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (2, 'Cansado', 'Trabalhando em entregas urgentes');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (3, 'Motivado', 'Reunião produtiva com o time');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (4, 'Neutro', 'Dia normal de atendimentos');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (5, 'Feliz', 'Finalizei o design do dashboard');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (6, 'Estressado', 'Alta demanda de entrevistas');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (7, 'Tranquilo', 'Dia leve no trabalho');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (8, 'Motivado', 'Pipeline automatizado funcionando');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (9, 'Cansado', 'Trabalhei até tarde ontem');
INSERT INTO TB_CHECKIN (ID_COLABORADOR, HUMOR, COMENTARIO) VALUES (10, 'Feliz', 'Análise de dados concluída com sucesso');

------------------------------------------------------------
-- RELATÓRIOS
------------------------------------------------------------
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (1, 8.5, 'Bom desempenho e humor estável');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (2, 6.0, 'Cansaço recorrente observado');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (3, 9.2, 'Excelente engajamento no time');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (4, 7.3, 'Atendimentos constantes, precisa descanso');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (5, 8.0, 'Alta satisfação com os resultados');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (6, 5.5, 'Sobrecarga de tarefas observada');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (7, 8.1, 'Equipe equilibrada e produtiva');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (8, 9.0, 'Desempenho técnico excelente');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (9, 6.8, 'Necessita apoio para gestão de tempo');
INSERT INTO TB_RELATORIO (ID_COLABORADOR, MEDIA_HUMOR, RESUMO) VALUES (10, 8.9, 'Humor e performance consistentes');

------------------------------------------------------------
-- ALERTAS
------------------------------------------------------------
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (2, 'Atenção', 'Níveis de cansaço acima da média');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (6, 'Crítico', 'Sinais de burnout identificados');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (9, 'Aviso', 'Baixo engajamento nas últimas semanas');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (4, 'Atenção', 'Queda no humor geral do setor');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (7, 'Informativo', 'Equilíbrio emocional constante');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (1, 'Informativo', 'Bom desempenho contínuo');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (3, 'Informativo', 'Equipe engajada');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (5, 'Atenção', 'Pequenas quedas de motivação');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (8, 'Informativo', 'Alta performance técnica');
INSERT INTO TB_ALERTA (ID_COLABORADOR, TIPO_ALERTA, DESCRICAO) VALUES (10, 'Informativo', 'Estabilidade emocional');


-- CONSULTAS DE APOIO À DECISÃO
------------------------------------------------------------

-- 1️ CONSULTA SIMPLES
-- Listar todos os colaboradores do cargo "Analista"
SELECT NOME, EMAIL, CARGO
FROM TB_COLABORADOR
WHERE CARGO = 'Analista'
ORDER BY NOME ASC;

------------------------------------------------------------

-- 2️ CONSULTA COM JUNÇÃO DE TABELAS
-- Exibir o humor mais recente de cada colaborador
SELECT c.nome, ch.humor, ch.comentario, ch.data_registro
FROM tb_colaborador c
JOIN tb_checkin ch
  ON ch.id_colaborador = c.id_colaborador
WHERE ch.data_registro = (
  SELECT MAX(ch2.data_registro)
  FROM tb_checkin ch2
  WHERE ch2.id_colaborador = c.id_colaborador
)
ORDER BY c.nome;

------------------------------------------------------------

-- 3️ CONSULTA COM FUNÇÃO DE GRUPO E AGRUPAMENTO
-- Calcular a média geral de humor por colaborador
SELECT C.NOME, ROUND(AVG(R.MEDIA_HUMOR),2) AS MEDIA_GERAL
FROM TB_COLABORADOR C
JOIN TB_RELATORIO R ON C.ID_COLABORADOR = R.ID_COLABORADOR
GROUP BY C.NOME
ORDER BY MEDIA_GERAL DESC;

------------------------------------------------------------

-- 4️ CONSULTA COM HAVING E JUNÇÃO
-- Listar colaboradores com média de humor abaixo de 7 (risco)
SELECT C.NOME, ROUND(AVG(R.MEDIA_HUMOR),2) AS MEDIA_HUMOR
FROM TB_COLABORADOR C
JOIN TB_RELATORIO R ON C.ID_COLABORADOR = R.ID_COLABORADOR
GROUP BY C.NOME
HAVING AVG(R.MEDIA_HUMOR) < 7
ORDER BY MEDIA_HUMOR ASC;










