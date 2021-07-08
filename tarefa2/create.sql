drop table if exists funcionario cascade;
drop table if exists departamento cascade;
drop table if exists projeto cascade;
drop table if exists atividade cascade;
drop table if exists atividade_projeto cascade;

CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,  
  `nome` varchar(15) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `depto` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE `departamento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(25) NOT NULL,
  `gerente` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `depGerenteFK` FOREIGN KEY (`gerente`) REFERENCES `funcionario`(`codigo`) on delete set null on update cascade
);

alter table funcionario ADD CONSTRAINT `funcDeptoFK` FOREIGN KEY (`depto`) REFERENCES `departamento` (`codigo`) on delete set null on update cascade;

CREATE TABLE `projeto` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(15) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `depto` int(11) DEFAULT NULL,
  `responsavel` int(11) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  foreign key (depto) references departamento(codigo) on delete set null,
  foreign key (responsavel) references funcionario(codigo) on delete set null
);

CREATE TABLE `atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(15) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `responsavel` int(11) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE `atividade_projeto` (
  `codAtividade` int(11) NOT NULL,
  `codProjeto` int(11) NOT NULL,
  PRIMARY KEY (`codProjeto`, `codAtividade`),
  foreign key (`codAtividade`) references atividade(codigo),
  foreign key (`codProjeto`) references projeto(codigo)
);

INSERT INTO funcionario (nome, sexo, dataNasc, salario, depto)
	VALUES 
			('Ana', 'F', '1988-05-07', 2500.00, 1),
			('Taciano', 'M', '1980-01-25', 2500.00, 2),
			('Maria', 'F', '1981-07-01', 2500.00, 1),
            ('Josefa', 'F', '1986-09-17', 2500.00, 1),
			('Carlos', 'M', '1985-11-21', 2500.00, 1),
            ('Humberto', 'M', '1970-05-07', 1500.00, 2);

INSERT INTO departamento (descricao, gerente)
	VALUES
			('Dep História', null),
            ('Dep Computação', null);
            
INSERT INTO projeto(descricao, nome, depto, responsavel, DataInicio, DataFim)
	VALUES
			('APF', 'Paulo', 2, 2, '2018-02-26', '2018-06-30'),
            ('Monitoria', 'Laura', 1, 2, '2018-02-26', '2018-06-30'),
			('BD','Pedro', 2, 1, '2018-02-26', '2018-06-30'),
			('ES','Renata', 1, 1, '2018-02-26', '2018-06-30', '2018-05-29');
            
INSERT INTO atividade(descricao, dataInicio, dataFim) 
	VALUES 
			('Preparar calendário', '2018-02-26', '2020-11-01'),
            ('Preparar calendário', '2018-02-26', '2020-11-10'),
            ('Consultar direção', '2018-02-26', '2020-11-02'),
            ('Consultar direção', '2018-02-26', '2020-11-03'),
            ('Consultar direção', '2018-02-26', '2020-11-04'),
            ('Emitir prestação de contas', '2018-02-26', '2020-11-10');

INSERT INTO atividade_projeto(codAtividade, codProjeto)
	VALUES (1, 1),
			(2, 2),
			(3, 2),
			(4, 3),
			(5, 4),
			(6, 2);
            