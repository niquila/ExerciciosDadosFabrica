-- Atualizar chaves primarias para NOT NULL
USE clinica_care;
ALTER TABLE especialidades MODIFY COLUMN id_especialidade INT NOT NULL AUTO_INCREMENT;
ALTER TABLE medicos        MODIFY COLUMN CRM VARCHAR(20) NOT NULL;
ALTER TABLE pacientes      MODIFY COLUMN cpf_paciente VARCHAR(14) NOT NULL;
ALTER TABLE consultas      MODIFY COLUMN id_consulta INT NOT NULL AUTO_INCREMENT;
ALTER TABLE prontuarios    MODIFY COLUMN id_prontuario INT NOT NULL AUTO_INCREMENT;
ALTER TABLE pagamentos     MODIFY COLUMN id_pagamento INT NOT NULL AUTO_INCREMENT;
ALTER TABLE prescricoes    MODIFY COLUMN id_prescricao INT NOT NULL AUTO_INCREMENT;

SELECT * FROM medicos
WHERE CRM = (SELECT MAX(CRM) FROM medicos);

SELECT * FROM medico_especialidade
WHERE CRM IN
(SELECT CRM FROM medico_especialidade GROUP BY CRM HAVING COUNT(*) > 1);

SELECT valor_total, Total FROM 
(SELECT valor_total, COUNT(*) AS Total FROM pagamentos GROUP BY valor_total) AS resumo;

SELECT  nome_especialidade, id_especialidade,
 CASE WHEN id_especialidade < 5 THEN 'Antigo' 
 WHEN id_especialidade BETWEEN 5 AND 10 THEN 'Recente'
 ELSE 'Novo' END AS Status FROM especialidades;
 
WITH resumo_consulta AS (
SELECT CRM, COUNT(*) AS Total FROM consultas GROUP BY CRM
)
 SELECT * FROM resumo_consulta WHERE Total > 1;
 
 SELECT nome, tipo_plano, email, 
 ROW_NUMBER() OVER (PARTITION BY tipo_plano ORDER BY email)
 AS Posicao FROM pacientes;
 
 CREATE INDEX idx_nome ON pacientes (telefone);