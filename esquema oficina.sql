-- Criação do banco de dados para o cenário de oficina mecânica

drop database oficina;

create database oficina;

use oficina;

-- criar tabela cliente
create table cliente(
	idClient int auto_increment primary key,
    Nome varchar(10) not null,
    SegundoNome varchar(20),
    Sobrenome varchar(20),
    CPF char(11),
    CNPJ char(15),
    Data_de_nascimento date not null, 
    Email varchar(25), 
    Telefone char(11) not null,
    UF char(2) not null,
    Cidade varchar(25) not null,
    bairro varchar(25) not null,
    CEP char(9),
    rua varchar(50),
    numero varchar(10),
    complemento varchar(25),
    constraint unique_cpf_client unique(CPF)
);

-- criar tabela cliente
create table veiculo(
	idVeiculo int auto_increment primary key,
	tipoVeiculo enum('carro', 'moto', 'caminhão', 'ônibus', 'van', 'outros') default 'carro',
    nomeVeiculo varchar(30),
    marca varchar(30),
    ano char(4),
    cor enum('branco', 'prata', 'preto', 'vermelho', 'azul', 'amarelo', 'outros') ,
    placa char(7) not null,
    constraint unique_veiculo unique(placa)
);

-- criar tabela mecanicos
create table mecanico(
	idMecanico int auto_increment primary key,
    nome varchar(15) not null,
    sobrenome varchar(15),
    especialidade1 enum('customização', 'ar-condionado', 'revisão geral', 'motor diesel', 'motor flex', 'eletricista', 'pintura', 'outros'),
    especialidade2 enum('customização', 'ar-condionado', 'revisão geral', 'motor diesel', 'motor flex', 'eletricista', 'pintura', 'outros'),
	CPF char(11) not null,
    Data_de_nascimento date not null, 
    Email varchar(25), 
    Telefone char(11) not null,
    UF char(2) not null,
    Cidade varchar(25) not null,
    bairro varchar(25) not null,
    CEP char(9) not null,
    rua varchar(50) not null,
    numero varchar(10) not null,
    complemento varchar(25)
);

-- criar tabela equipe
create table equipe(
	idEquipe int auto_increment primary key,
    tipoEquipe enum('revisão 1', 'revisão 2', 'revisão 3', 'reparo 1', 'reparo 2', 'reparo 3') not null
);

-- criar tabela ordem de serviço
create table ordemServiço(
	idOrdemServiço int auto_increment primary key,
    idOSEquipe int,
    dataEmissão date,
    dataConclusão date,
    statusOS enum('avaliando', 'executando', 'concluido') not null,
    tipoServiço enum('revisão', 'reparo') not null,
    constraint fk_idOSEquipe foreign key(idOSEquipe) references  equipe(idEquipe)
);

-- criar tabela valor serviço
create table valorServiço(
	idValorServiço int auto_increment primary key,
    idVSordem int,
    HHmãoDeObra float,
    horasTrabalhadas float,
    preçoPecas float,
    constraint fk_idVSordem foreign key(idVSordem) references ordemServiço(idOrdemServiço)
);


-- criar tabela VeiculoCliente
create table veiculoCliente(
	idVCcliente int ,
    idVCveiculo int ,
    primary key (idVCcliente, idVCveiculo),
    constraint fk_VCcliente foreign key(idVCcliente) references cliente(idClient),
    constraint fk_VCveiculo foreign key(idVCveiculo) references veiculo(idVeiculo)
);

-- criar tabela EquipeVeiculo
create table equipeVeiculo(
	idEVequipe int ,
    idEVveiculo int ,
    primary key (idEVequipe, idEVveiculo),
    constraint fk_EVequipe foreign key(idEVequipe) references equipe(idEquipe),
    constraint fk_EVveiculo foreign key(idEVveiculo) references veiculo(idVeiculo)
);

-- criar tabela EquipeMecanico
create table equipeMecanico(
	idEMequipe int ,
    idEMmecanico int ,
    primary key (idEMequipe, idEMmecanico),
    constraint fk_EMequipe foreign key(idEMequipe) references equipe(idEquipe),
    constraint fk_EMmecanico foreign key(idEMmecanico) references mecanico(idMecanico)
);


-- Inserindo Dados

use oficina;

show tables;

insert into cliente (Nome, SegundoNome, Sobrenome, CPF, CNPJ, Data_de_nascimento, Email, Telefone, UF, Cidade, bairro, CEP, rua, numero , complemento) 
		values ('Bruno', 'Soares', 'dos Santos', '13389012341', null, '1996-10-14', 'bruningostoso@gmail.com', '21999252698', 'RJ', 'Rio de Janeiro', 'Ipanema','20280150', 'avenida Atlantica', '100', 'apartamento:280, bloco:1'), 
			   ('Rosa', 'Soares', 'dos Santos', '13389012234', null, '1968-08-14', 'rosasoares@gmail.com', '21999259039', 'RJ', 'Rio de Janeiro', 'Ipanema','20280150', 'avenida Atlantica', '100', 'apartamento:280, bloco:1'), 
               ('Jorge', 'Soares', 'dos Santos', '15689012341', null, '1968-04-01', 'jorginho12@gmail.com', '21998312698', 'RJ', 'Rio de Janeiro', 'Ipanema','20280150', 'avenida Atlantica', '100', 'apartamento:280, bloco:1'), 
               ('Gabi', 'Soares', 'dos Santos', '13389012789', null, '1994-11-14', 'gabizinhhass@gmail.com', '32999252698', 'MG', 'Coimbra', 'Centro','32380150', 'avenida brasil', '15', null), 
               ('Pedrinho', 'Acorda', 'Campeonato', '56789012341', null, '2000-10-14', 'acordapedrinho@gmail.com', '15999252696', 'SP', 'Itapetininga', 'Vila João','15208033', 'avenida brasil', '33', 'casa dos fundos');

    
insert into veiculo (tipoVeiculo, nomeVeiculo, marca, ano, cor, placa)
	values('carro', 'Siena', 'fiat', '2012', 'prata', 'lpd1234'),
		  ('carro', 'Fusca', 'volkswagen', '1970', 'azul', 'abc1234'),
		  ('carro', 'Uno', 'fiat', '1996', 'outros', 'abc5678'),
		  ('carro', 'Duster', 'renault', '2021', 'preto', 'def1234'),
		  ('caminhão', 'Constellation', 'volkswagen', '2020', 'branco', 'efg1234'),
		  ('caminhão', 'Constellation', 'volkswagen', '2015', 'prata', 'hij1234'),
		  ('ônibus', 'Volksbus 15.190 ODS', 'volkswagen', '2020', 'preto', 'klm1234'),
		  ('moto', 'titan', 'honda', '2018', 'vermelho', 'lpd5678');
          

insert into mecanico (nome, sobrenome, especialidade1, especialidade2, CPF, Data_de_nascimento, Email, Telefone, UF, Cidade, bairro, CEP, rua, numero, complemento)
	values ('Reynaldo', 'Gianecchini', 'revisão geral','customização', '13389012567', '1980-10-14', 'mecanicogato@gmail.com', '21988252698', 'RJ', 'Rio de Janeiro', 'Copacabana','20280122', 'avenida Atlantica', '1000', 'apartamento:300'),
		   ('Paulão', 'Grande', 'eletricista', 'pintura', '13389012589', '1982-11-20', 'grandefamilia@gmail.com', '21950252698', 'RJ', 'Rio de Janeiro', 'Meier','20140122', 'avenida dias da cruz', '1050', 'casa do fundos'),
           ('Macgyver', 'Soares', 'motor diesel', 'customização', '16689012589', '1970-01-20', 'macgyverresolve@gmail.com', '21950252612', 'RJ', 'Rio de Janeiro', 'Taquara','20140150', 'rua pedra da gávea', '70', null),
           ('Tonhão', 'Barbosa', 'motor flex', 'revisão geral', '16689012512', '1970-12-25', 'piadamecanico@gmail.com', '21950252633', 'RJ', 'Rio de Janeiro', 'Praça da bandeira','20240150', 'rua ceara', '150', null),
           ('Rodolfo', 'Ramos', 'outros', 'revisão geral', '16689015155', '1960-07-30', 'rodolfinho1960@gmail.com', '21988252633', 'RJ', 'Rio de Janeiro', 'Praça da bandeira','20240150', 'rua ceara', '100', null);
           
           
insert into equipe (tipoEquipe)
	values('revisão 1'),
		  ('revisão 2'),
          ('revisão 3'),
          ('reparo 1'),
          ('revisão 2'),
          ('revisão 3');
          
    
insert into ordemServiço(idOSEquipe, dataEmissão, dataConclusão, statusOS, tipoServiço)
	values('1', '2022-01-29', '2022-01-29', 'concluido', 'revisão'),
		  ('1', '2022-09-22', '2022-09-22', 'concluido', 'revisão'),
          ('1', '2022-10-22', '2022-10-22', 'concluido', 'revisão'),
          ('2', '2022-10-22', '2022-10-24', 'concluido', 'revisão'),
          ('2', '2022-10-26', '2022-10-30', 'concluido', 'revisão'),
          ('3', '2022-10-30', '2022-11-13', 'executando', 'revisão'),
          ('2', '2022-11-04', '2022-11-11', 'avaliando', 'revisão'),
          ('4', '2022-09-04', '2022-10-11', 'concluido', 'reparo'),
          ('4', '2022-08-10', '2022-10-11', 'concluido', 'reparo'),
          ('5', '2022-08-10', '2022-11-11', 'executando', 'reparo'),
          ('5', '2022-11-03', '2022-11-15', 'avaliando', 'reparo'),
          ('6', '2022-09-03', '2022-11-15', 'executando', 'reparo'),
          ('6', '2022-09-03', '2022-10-15', 'concluido', 'reparo');
          

insert into valorServiço(idVSordem,  HHmãoDeObra, horasTrabalhadas, preçoPecas)
	values('1', '20.00', '8.5', '150.90'),
		  ('2', '20.00', '6.5', '100.90'),
          ('3', '20.00', '8.5', '300.90'),
          ('4', '20.00', '12.3', '150.90'),
          ('5', '20.00', '8.5', '150.90'),
          ('6', '20.00', '8.5', '150.90'),
          ('7', '20.00', '8.5', '150.90'),
          ('8', '30.00', '20.5', '350.90'),
          ('9', '30.00', '20.5', '1350.90'),
          ('10', '30.00', '22.5', '450.90'),
          ('11', '35.00', '29.5', '999.90'),
          ('11', '22.00', '25.5', '350.90'),
          ('12', '35.00', '30.5', '1200.90');
          
		
insert into veiculoCliente(idVCcliente, idVCveiculo)
	values(1,1),
		  (1,2),
          (1,3),
          (2,1),
          (3,1),
          (4,5),
          (4,6),
          (5,7),
          (5,8);
          

insert into equipeVeiculo(idEVequipe, idEVveiculo)
	values(1,1),
		  (2,2),
          (3,3),
          (3,1),
          (6,1),
          (4,5),
          (4,6),
          (5,7),
          (5,8);
          

insert into equipeMecanico(idEMequipe, idEMmecanico)
	values(1,1),
		  (1,4),
          (2,1),
          (2,5),
          (3,4),
          (3,5),
          (4,2),
          (4,3),
          (5,2),
          (5,4),
          (6,3);
          
          
-- Realizando consultas SQL

-- Conta a quantidade de clientes 
select count(*) from cliente;

-- ver quem é o dono do veiculo de placa 'lpd5678'
select c.nome, c.Telefone, v.nomeVeiculo, v.placa from cliente c
		inner join veiculoCliente cv on c.idClient = cv.idVCcliente
		inner join veiculo v on cv.idVCveiculo = v.idVeiculo
        where v.placa = 'lpd5678';
        
-- vai chegar um carro para revisão qual funcionário é mais indicado para consertar?
select concat(nome,' ',sobrenome) as funcionário, especialidade1, especialidade2 from mecanico
        where especialidade1 = 'revisão geral'
        or especialidade2 = 'revisão geral';
        
-- quais os valores dos conserto dos carros?
select v.nomeVeiculo, v.tipoVeiculo, v.placa, sum((vs.HHmãoDeObra * vs.horasTrabalhadas) + vs.preçoPecas) as 'Valor total' from veiculo v
		inner join equipeVeiculo ev on v.idVeiculo = ev.idEVveiculo
        inner join equipe e on ev.idEVequipe= e.idEquipe
        inner join ordemServiço os on e.idEquipe = os.idOSEquipe
        inner join valorServiço vs on os.idOrdemServiço = vs.idVSordem
	group by v.placa
	order by sum((vs.HHmãoDeObra * vs.horasTrabalhadas) + vs.preçoPecas);

    
-- quais veiculos com mais de 48h de trabalho?
select v.nomeVeiculo, v.tipoVeiculo, v.placa, sum(vs.horasTrabalhadas)  from veiculo v
		inner join equipeVeiculo ev on v.idVeiculo = ev.idEVveiculo
        inner join equipe e on ev.idEVequipe= e.idEquipe
        inner join ordemServiço os on e.idEquipe = os.idOSEquipe
        inner join valorServiço vs on os.idOrdemServiço = vs.idVSordem
	group by v.placa
	having sum(vs.horasTrabalhadas)>48;