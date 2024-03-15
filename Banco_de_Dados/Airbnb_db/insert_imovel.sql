-- REGISTROS TABELA IMÓVEL
USE airbnb_db;

ALTER TABLE imovel
MODIFY COLUMN id_imovel INT AUTO_INCREMENT NOT NULL;

INSERT INTO imovel (cpf_anfitriao, preco_per_noite, cidade, titulo, tipo_imovel, limite_hospede, qtd_quartos, qtd_banheiros, wifi, tv, pet_friendly, ar_condicionado, piscina, churrasqueira, horario_check_in, horario_check_out, descricao, avaliacao) 
SELECT cpf, 
    CASE 
        WHEN cpf = '12345678900' THEN 150.00
        WHEN cpf = '23456789001' THEN 120.00
        WHEN cpf = '34567890102' THEN 200.00
        WHEN cpf = '45678901203' THEN 80.00
        WHEN cpf = '56789012304' THEN 100.00
        WHEN cpf = '67890123405' THEN 180.00
        WHEN cpf = '78901234506' THEN 250.00
        WHEN cpf = '89012345607' THEN 300.00
        WHEN cpf = '90123456708' THEN 90.00
        WHEN cpf = '01234567809' THEN 70.00
        WHEN cpf = '12345338910' THEN 110.00
        WHEN cpf = '09876543211' THEN 200.00
        WHEN cpf = '98765432112' THEN 150.00
        WHEN cpf = '11122233314' THEN 80.00
        WHEN cpf = '22233344415' THEN 100.00
        WHEN cpf = '33344455516' THEN 120.00
        WHEN cpf = '44455566617' THEN 70.00
        WHEN cpf = '55566677718' THEN 90.00
        WHEN cpf = '66677788819' THEN 150.00
        WHEN cpf = '77788899920' THEN 200.00
    END AS preco_per_noite,
    CASE 
        WHEN cpf = '12345678900' THEN 'Rio de Janeiro'
        WHEN cpf = '23456789001' THEN 'Florianópolis'
        WHEN cpf = '34567890102' THEN 'Gramado'
        WHEN cpf = '45678901203' THEN 'Campos do Jordão'
        WHEN cpf = '56789012304' THEN 'Porto de Galinhas'
        WHEN cpf = '67890123405' THEN 'Búzios'
        WHEN cpf = '78901234506' THEN 'Fernando de Noronha'
        WHEN cpf = '89012345607' THEN 'Cancún'
        WHEN cpf = '90123456708' THEN 'Maceió'
        WHEN cpf = '01234567809' THEN 'Porto Seguro'
        WHEN cpf = '12345338910' THEN 'Natal'
        WHEN cpf = '09876543211' THEN 'Balneário Camboriú'
        WHEN cpf = '98765432112' THEN 'Angra dos Reis'
        WHEN cpf = '11122233314' THEN 'Búzios'
        WHEN cpf = '22233344415' THEN 'Porto de Galinhas'
        WHEN cpf = '33344455516' THEN 'Cancún'
        WHEN cpf = '44455566617' THEN 'Natal'
        WHEN cpf = '55566677718' THEN 'Rio de Janeiro'
        WHEN cpf = '66677788819' THEN 'Florianópolis'
        WHEN cpf = '77788899920' THEN 'Búzios'
    END AS cidade,
    CASE 
        WHEN cpf = '12345678900' THEN 'Casa na Praia'
        WHEN cpf = '23456789001' THEN 'Apartamento Central'
        WHEN cpf = '34567890102' THEN 'Chalé na Montanha'
        WHEN cpf = '45678901203' THEN 'Cabana Rústica'
        WHEN cpf = '56789012304' THEN 'Casa de Praia'
        WHEN cpf = '67890123405' THEN 'Vila Charmosa'
        WHEN cpf = '78901234506' THEN 'Bangalô Luxuoso'
        WHEN cpf = '89012345607' THEN 'Apartamento de Luxo'
        WHEN cpf = '90123456708' THEN 'Casa de Campo'
        WHEN cpf = '01234567809' THEN 'Casa Simples'
        WHEN cpf = '12345338910' THEN 'Casa com Piscina'
        WHEN cpf = '09876543211' THEN 'Cobertura Moderna'
        WHEN cpf = '98765432112' THEN 'Casa na Ilha'
        WHEN cpf = '11122233314' THEN 'Cabana Rústica'
        WHEN cpf = '22233344415' THEN 'Chalé Aconchegante'
        WHEN cpf = '33344455516' THEN 'Apartamento Confortável'
        WHEN cpf = '44455566617' THEN 'Casa Simples'
        WHEN cpf = '55566677718' THEN 'Apartamento Moderno'
        WHEN cpf = '66677788819' THEN 'Casa de Praia'
        WHEN cpf = '77788899920' THEN 'Casa Charmosa'
    END AS titulo,
    CASE 
        WHEN cpf IN ('12345678900', '34567890102', '56789012304', '78901234506', '12345338910', '22233344415') THEN 'Casa'
        WHEN cpf IN ('23456789001', '90123456708', '01234567809', '66677788819') THEN 'Apartamento'
        ELSE 'Chalé'
    END AS tipo_imovel,
    CASE 
        WHEN cpf IN ('12345678900', '23456789001', '34567890102', '45678901203', '55566677718') THEN 8
        WHEN cpf IN ('56789012304', '67890123405', '90123456708', '09876543211', '11122233314', '77788899920') THEN 10
        ELSE 6
    END AS limite_hospede,
    CASE 
        WHEN cpf IN ('12345678900', '56789012304', '66677788819') THEN 4
        WHEN cpf IN ('23456789001', '67890123405', '01234567809', '12345338910', '22233344415', '33344455516', '44455566617') THEN 2
        ELSE 3
    END AS qtd_quartos,
    CASE 
        WHEN cpf IN ('12345678900', '56789012304') THEN 3
        WHEN cpf IN ('23456789001', '67890123405', '90123456708', '01234567809', '12345338910', '44455566617') THEN 1
        ELSE 2
    END AS qtd_banheiros,
    CASE 
        WHEN cpf IN ('12345678900', '23456789001', '34567890102', '56789012304', '67890123405', '78901234506', '90123456708', '01234567809', '12345338910', '44455566617') THEN TRUE
        ELSE FALSE
    END AS wifi,
    CASE 
        WHEN cpf IN ('12345678900', '23456789001', '34567890102', '45678901203', '56789012304', '67890123405', '78901234506', '89012345607', '90123456708', '01234567809', '12345338910', '98765432112', '55566677718', '77788899920') THEN TRUE
        ELSE FALSE
    END AS tv,
    CASE 
        WHEN cpf IN ('12345678900', '56789012304', '78901234506') THEN TRUE
        ELSE FALSE
    END AS pet_friendly,
    CASE 
        WHEN cpf IN ('12345678900', '23456789001', '56789012304', '67890123405', '78901234506', '89012345607', '90123456708', '01234567809', '12345338910', '44455566617') THEN TRUE
        ELSE FALSE
    END AS ar_condicionado,
    CASE 
        WHEN cpf IN ('12345678900', '56789012304', '67890123405', '78901234506') THEN TRUE
        ELSE FALSE
    END AS piscina,
    CASE 
        WHEN cpf IN ('12345678900', '67890123405') THEN TRUE
        ELSE FALSE
    END AS churrasqueira,
    CASE 
        WHEN cpf IN ('12345678900', '23456789001', '34567890102', '45678901203', '56789012304', '67890123405', '78901234506', '89012345607', '90123456708', '01234567809', '12345338910', '55566677718', '66677788819') THEN '14:00:00'
        ELSE '15:00:00'
    END AS horario_check_in,
    CASE 
        WHEN cpf IN ('12345678900', '23456789001', '34567890102', '45678901203', '56789012304', '67890123405', '78901234506', '89012345607', '90123456708', '01234567809', '12345338910', '55566677718', '66677788819') THEN '12:00:00'
        ELSE '11:00:00'
    END AS horario_check_out,
    CASE 
        WHEN cpf = '12345678900' THEN 'Uma casa aconchegante próxima à praia.'
        WHEN cpf = '23456789001' THEN 'Apartamento bem localizado no centro da cidade.'
        WHEN cpf = '34567890102' THEN 'Um chalé aconchegante com vista para as montanhas.'
        WHEN cpf = '45678901203' THEN 'Uma cabana rústica para os amantes da natureza.'
        WHEN cpf = '56789012304' THEN 'Casa ampla com piscina próxima à praia.'
        WHEN cpf = '67890123405' THEN 'Uma vila charmosa com jardim e churrasqueira.'
        WHEN cpf = '78901234506' THEN 'Um bangalô luxuoso com vista para o mar.'
        WHEN cpf = '89012345607' THEN 'Apartamento de alto padrão com vista para o mar.'
        WHEN cpf = '90123456708' THEN 'Uma casa espaçosa em meio à natureza.'
        WHEN cpf = '01234567809' THEN 'Uma casa simples e confortável para curtir as férias.'
        WHEN cpf = '12345338910' THEN 'Casa espaçosa com piscina para toda a família.'
        WHEN cpf = '09876543211' THEN 'Cobertura moderna com vista para o mar.'
        WHEN cpf = '98765432112' THEN 'Casa luxuosa em uma ilha paradisíaca.'
        WHEN cpf = '11122233314' THEN 'Cabana rústica com vista para o mar.'
        WHEN cpf = '22233344415' THEN 'Chalé aconchegante próximo à praia.'
        WHEN cpf = '33344455516' THEN 'Apartamento confortável com vista para o mar.'
        WHEN cpf = '44455566617' THEN 'Casa simples e aconchegante para relaxar.'
        WHEN cpf = '55566677718' THEN 'Apartamento moderno próximo à praia de Copacabana.'
        WHEN cpf = '66677788819' THEN 'Casa ampla com piscina próxima à praia.'
        WHEN cpf = '77788899920' THEN 'Casa charmosa co...'
    END AS descricao,
    CASE 
        WHEN cpf = '12345678900' THEN 4.5
        WHEN cpf = '23456789001' THEN 4.2
        WHEN cpf = '34567890102' THEN 4.7
        WHEN cpf = '45678901203' THEN 4.0
        WHEN cpf = '56789012304' THEN 4.3
        WHEN cpf = '67890123405' THEN 4.7
        WHEN cpf = '78901234506' THEN 3.9
        WHEN cpf = '89012345607' THEN 4.1
        WHEN cpf = '90123456708' THEN 4.4
        WHEN cpf = '01234567809' THEN 4.6
        WHEN cpf = '12345338910' THEN 4.0
        WHEN cpf = '09876543211' THEN 5
        WHEN cpf = '98765432112' THEN 3
        WHEN cpf = '11122233314' THEN 2
        WHEN cpf = '22233344415' THEN 5
        WHEN cpf = '33344455516' THEN 4.2
        WHEN cpf = '44455566617' THEN 4.4
        WHEN cpf = '55566677718' THEN 4.6
        WHEN cpf = '66677788819' THEN 3.8
        WHEN cpf = '77788899920' THEN 4.2
    END AS avaliacao
FROM anfitriao;
