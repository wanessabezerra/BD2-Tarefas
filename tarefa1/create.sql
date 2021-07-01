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
    cnpj NUMERIC(12) UNIQUE NOT NULL,  
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
	REFERENCES companhia(cod_companhia)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO empregado (cod_empregado, nome_empregado, rua, cidade, salario)
	VALUES 
		(2101, 'Wanessa', 'Valdemar Araujo Sampaio', 'Parelhas', 13000),
		(2102, 'Pedro', 'Sete de Setembro', 'Parelhas', 3000),
		(2103, 'Luiz', 'Avani Azevedo', 'Caicó', 12000),
		(2104, 'Henrique', 'Francisco Assis Filho', 'Caicó', 4000)
;

INSERT INTO companhia (cod_companhia, cnpj, nome_companhia, cidade_companhia)
	VALUES
		(1201,'123456789123', 'Soft Sell', 'Parelhas'),
		(1202,'123456789124', 'Soft Sell', 'Parelhas'),
		(1001,'123456789125', 'Xuxa', 'Caicó'),
		(1002,'123456789126', 'Xuxa', 'Caicó')
;

INSERT INTO trabalha (cod_empregado, cod_companhia)
	VALUES 
		(2101,'1201'),
		(2102,'1202'),
		(2103,'1001'),
		(2104,'1002')
;

INSERT INTO gerente (cod_empregado, cod_companhia)
	VALUES 
		(2101,'1201'),
		(2103,'1001')
;

SELECT * FROM
	empregado,
  companhia,
	trabalha,
	gerente
;
