create database airbnb_db;
USE airbnb_db;

DROP TABLE hospede;
DROP TABLE anfitriao;
DROP TABLE imovel;
DROP TABLE reserva;

create table hospede(
	cpf varchar(11) NOT NULL,
    primary key(cpf),
    nome varchar(50),
    email varchar(50),
    telefone varchar(15),
    forma_pagamento varchar(50),
    avaliacao float
);

create table anfitriao(
	cpf varchar(11) NOT NULL,
    primary key(cpf),
    nome varchar(50),
    email varchar(50),
    telefone varchar(15),
    idioma varchar(20),
    avaliacao float
);

create table imovel(
	id_imovel int NOT NULL AUTO_INCREMENT,
    primary key(id_imovel),
    cpf_anfitriao varchar(11),
    FOREIGN KEY (cpf_anfitriao) REFERENCES anfitriao(cpf),
    preco_per_noite float,
    cidade varchar(30),
    titulo varchar(100),
    tipo_imovel varchar(30),
    limite_hospede int,
    qtd_quartos int,
    qtd_banheiros int,
    wifi boolean,
    tv boolean,
    pet_friendly boolean,
    ar_condicionado boolean,
    piscina boolean,
    churrasqueira boolean,
    horario_check_in time,
    horario_check_out time,
    descricao varchar(255),
    avaliacao float
    
);

create table reserva(
	id_reserva int NOT NULL AUTO_INCREMENT ,
    primary key(id_reserva),
    qtd_hospede int,
    check_in date,
    check_out date,
    id_imovel int, 
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
    cpf_hospede varchar(11),
    FOREIGN KEY (cpf_hospede) REFERENCES hospede(cpf)
);

