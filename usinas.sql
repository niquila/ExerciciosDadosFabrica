CREATE table regioes(
id_regiao INT(60) NOT NULL,
nome VARCHAR(50) NOT NULL,
estados VARCHAR(40) NOT NULL,
potencial_energetico VARCHAR(100),
PRIMARY KEY(id_regiao)

);

CREATE table usinas(
id_usina INT(60) NOT NULL,
nome_usina VARCHAR(50) NOT NULL,
tipo VARCHAR(40),
id_regiao INT,
PRIMARY KEY(id_usina),
CONSTRAINT fk_regiao FOREIGN KEY (id_regiao) 
REFERENCES regioes(id_regiao)
);

CREATE table geracao(
id_geracao INT(60) NOT NULL,
quantidade_energia VARCHAR(50) NOT NULL,
id_usina INT,
PRIMARY KEY(id_geracao),
CONSTRAINT fk_usina FOREIGN KEY (id_usina) 
REFERENCES usinas(id_usina)
);

ALTER TABLE regioes
CHANGE COLUMN nome nome_regiao VARCHAR(50) NOT NULL;

INSERT INTO 
regioes(id_regiao, nome_regiao, estados, potencial_energetico)
VALUES(1, 'norte', 'AM, PA, AP, AC, TO, RR e RO', 'cerca de 105000 MW');

INSERT INTO 
regioes(id_regiao, nome_regiao, estados, potencial_energetico)
VALUES(2, 'nordeste', 'MA, PI, CE, RN, PB, PE, AL, SE e BA', 'cerca de 18500 MW (eólica) e 14500 MW (solar)');

INSERT INTO 
regioes(id_regiao, nome_regiao, estados, potencial_energetico)
VALUES(3, 'centro-oeste', 'MT, MS, GO e DF', 'solar (~10% da capacidade nacional) e biomassa');

INSERT INTO 
regioes(id_regiao, nome_regiao, estados, potencial_energetico)
VALUES(4, 'sudeste', 'SP, RJ, MG e ES', 'hidrelétrica ~24.5 GW, biomassa e térmica ~6 GW cada');

INSERT INTO 
regioes(id_regiao, nome_regiao, estados, potencial_energetico)
VALUES(5, 'sul', 'PR, SC e RS', 'cerca de 41400 MW (hidrelétrica)');



INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(1, 'Belo Monte', 'hidrelétrica', 1);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(2, 'Tucuruí', 'hidrelétrica', 1);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(3, 'Pecém II', 'termelétrica', 2);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(4, 'Complexo Eólico Ventos do Piauí', 'eólica', 2);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(5, 'UHE Manso', 'hidrelétrica', 3);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(6, 'Usina Bracell', 'biomassa', 4);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(7, 'Itaipu Binacional', 'hidrelétrica', 5);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(8, 'Complexo Eólico Osório', 'eólica', 5);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(9, 'UHE Santo Antônio', 'hidrelétrica', 1);

INSERT INTO usinas(id_usina, nome_usina, tipo, id_regiao)
VALUES(10, 'UHE Ilha Solteira', 'hidrelétrica', 4);



INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(1, '11233 MW', 1, '24 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(2, '8535 MW', 2, '24 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(3, '1080 MW', 3, '12 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(4, '250 MW', 4, '18 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(5, '212 MW', 5, '24 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(6, '420 MW', 6, '20 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(7, '14000 MW', 7, '24 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(8, '302 MW', 8, '16 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(9, '3568 MW', 9, '24 horas');

INSERT INTO geracao(id_geracao, quantidade_energia, id_usina, tempo)
VALUES(10, '3444 MW', 10, '24 horas');

ALTER TABLE geracao
ADD COLUMN tempo VARCHAR(30);

UPDATE geracao
SET tempo = '20 horas'
WHERE id_geracao = 1;

SELECT COUNT(*) FROM usinas;

SELECT MIN(quantidade_energia) FROM geracao;

SELECT MAX(potencial_energetico) FROM regioes;

SELECT u.nome_usina, r.nome_regiao
FROM usinas u
JOIN regioes r ON u.id_regiao = r.id_regiao;

SELECT r.nome_regiao, COUNT(*) AS total_usinas
FROM usinas u
JOIN regioes r ON u.id_regiao = r.id_regiao
GROUP BY r.nome_regiao
HAVING COUNT(*) > 1;



SELECT *
FROM regioes;

SELECT *
FROM usinas;

SELECT *
FROM geracao;


