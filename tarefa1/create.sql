drop table if exists empregado cascade;
drop table if exists companhia cascade;
drop table if exists trabalha cascade;
drop table if exists gerente cascade;

CREATE TABLE empregado(
    cod_empregado NUMERIC(4) PRIMARY KEY NOT NULL,  
    nome_empregado CHAR(100) NOT NULL,
    rua CHAR(255) NOT NULL,
    cidade CHAR(100) NOT NULL,
    salario FLOAT NOT NULL
);

CREATE TABLE companhia (
    cod_companhia NUMERIC(4) PRIMARY KEY NOT NULL,
    cnpj CHAR(12) UNIQUE NOT NULL,  
    nome_companhia CHAR(100) NOT NULL,
    cidade_companhia CHAR(100) NOT NULL
);

CREATE TABLE trabalha (
    cod_empregado NUMERIC(4) PRIMARY KEY NOT NULL,  
    cod_companhia NUMERIC(4) NOT NULL,
    CONSTRAINT fk_empregado FOREIGN KEY (cod_empregado)
        REFERENCES empregado(cod_empregado)
        ON DELETE RESTRICT ON UPDATE CASCADE,
 	CONSTRAINT fk_cod_companhia FOREIGN KEY (cod_companhia)
        REFERENCES companhia(cod_companhia)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE gerente (
    cod_empregado NUMERIC(4) PRIMARY KEY NOT NULL,  
    cod_companhia NUMERIC(4) NOT NULL,
  	CONSTRAINT empregado_fk FOREIGN KEY (cod_empregado)
       	REFERENCES empregado(cod_empregado)
        ON DELETE RESTRICT ON UPDATE CASCADE,
  	CONSTRAINT companhia_fk FOREIGN KEY (cod_companhia)
       	REFERENCES companhia(c)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO empregado (cod_empregado, nome_empregado, rua, cidade, salario)
	VALUES 
		(2101, 'Wanessa', 'Valdemar Araujo Sampaio', 'parelhas', 10000),
		(2102, 'Pedro', 'Sete de Setembro', 'parelhas', 2000),
		(2103, 'Luiz', 'Avani Azevedo', 'parelhas', 3000),
		(2104, 'Henrique', 'Francisco Assis Filho', 'parelhas', 2000)
;

INSERT INTO companhia (cod_companhia, cnpj, nome_companhia, cidade)
	VALUES
		(1201,'123456789123', 'Soft Sell', 'parelhas'),
		(1203,'123456789124', 'Soft Sell', 'parelhas'),
		(1204,'123456789125', 'Other', 'parelhas'),
		(1205,'123456789126', 'Other', 'parelhas')
;

INSERT INTO trabalha (cod_empregado, cod_companhia)
	VALUES 
    (1201,'123456789123'),
		(1203,'123456789124'),
		(1204,'123456789125'),
		(1205,'123456789126')
;

INSERT INTO gerente (cod_empregado, cod_companhia)
	VALUES 
		(1201,'123456789123'),
		(1203,'123456789124')
;

