-- REGISTROS TABELA RESERVA
USE airbnb_db;

-- Criação dos 50 registros para a tabela reserva
INSERT INTO reserva (qtd_hospede, check_in, check_out, id_imovel, cpf_hospede) 
SELECT 
    FLOOR(RAND() * 5) + 1 as qtd_hospede, 
    DATE_ADD('2015-01-01', INTERVAL FLOOR(RAND() * (DATEDIFF('2020-12-31', '2015-01-01'))) DAY) as check_in, 
    DATE_ADD(DATE_ADD('2015-01-01', INTERVAL FLOOR(RAND() * (DATEDIFF('2020-12-31', '2015-01-01'))) DAY), INTERVAL FLOOR(RAND() * (DATEDIFF('2020-12-31', '2015-01-01'))) DAY) as check_out, 
    (SELECT id_imovel FROM imovel ORDER BY RAND() LIMIT 1) as id_imovel, 
    cpf 
FROM (
    SELECT cpf FROM hospede ORDER BY RAND() LIMIT 50
) AS h;

