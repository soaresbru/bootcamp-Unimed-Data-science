-- criação do banco de dados para o cenário de E-commerce

drop database ecommerce;

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table cliente(
	idClient int auto_increment primary key,
    Nome varchar(10),
    SegundoNome varchar(20),
    Sobrenome varchar(20),
    CPF char(11),
    Data_de_nascimento date, 
    Email varchar(25), 
    Telefone char(11),
    UF char(2),
    Cidade varchar(25),
    bairro varchar(25),
    CEP char(9),
    rua varchar(50),
    numero varchar(10),
    complemento varchar(25),
    constraint unique_cpf_client unique(CPF)
);

alter table cliente auto_increment=1;

-- criar tabela produto
create table produto(
	idProduto int auto_increment primary key,
    nome varchar(50) not null,
    categoria enum('Eletrônico', 'Vestuário', 'Alimentos e bebidas', 'infantil', 'Eletrodomesticos','outros') not null,
    descrição varchar(100),
    valor float,
    avaliação float default 0,
    dimensões varchar(15)
);

-- criar tabela pedido
create table pedido(
	idPedido int auto_increment primary key,
    idPedidoClient int,
    idPagamento int,
    pedidoStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    DescriçãoPedido varchar(255),
    valorFrete float default 0,
    boletoOuPix bool default false,
    constraint fk_pedido_cliente foreign key(idPedidoClient) references cliente(idClient)
		on update cascade
);

-- criar tabela entrega
create table entrega(
	idEntrega int auto_increment primary key,
    idEntregaPedido int,
    codigoRastreio varchar(45),
    statusEntrega enum('CDD', 'saiu para entrega', 'entregando', 'entregue'),
    prazoEntrega date,
    constraint fk_entrega_pedido foreign key(idEntregaPedido) references pedido(idPedido)
);

-- criar tabela pagamento
create table pagamentoCartao(
	idPagamentoCartao int auto_increment primary key,
    idCliente int,
    tipoPagamento enum('Cartão', 'Dois cartões'),
    nomeCartao varchar(50),
    numeroCartao char(16),
    bandeiraCartao varchar(20),
    validade char(10),
    codigoSegurança char(3),
    constraint fk_idCliente foreign key(idCliente) references cliente(idClient)
);

-- criar tabela estoque 
create table estoque(
	idEstoque int auto_increment primary key,
    localização varchar(255),
    nome_responsavel varchar(50), 
    email varchar(50),
    telefone char(11),
    quantidade int default 0
);

-- criar tabela fornecedor
create table fornecedor(
	idFornecedor int auto_increment primary key,
    RazãoSocial varchar(255) not null,
    NomeFantasia varchar(20),
    CNPJ char(15) not null,
    endereçoFornecedor varchar(100),
    email varchar(50),
    telefone char(11) not null,
    constraint unico_fornecedor unique(CNPJ)
);

-- criar tabela vendedor
create table vendedor(
	idVendedor int auto_increment primary key,
    RazãoSocial varchar(255) not null,
    NomeFantasia varchar(255) not null,
    CNPJ char(15),
    CPF char(11),
    endereço varchar(100),
    email varchar(50),
    telefone char(11) not null,
    constraint unico_CNPJ_vendedor unique(CNPJ),
    constraint unico_CPF_vendedor unique(CPF)
);

-- criar tabela produtoVendedor
create table produtoVendedor(
	idProdutoVendedor int,
    idProdutoProduto int ,
    quantidade int default 1,
    primary key (idProdutoVendedor, idProdutoProduto),
    constraint fk_produto_vendedor foreign key(idProdutoVendedor) references vendedor(idVendedor),
    constraint fk_produto_produto foreign key(idProdutoProduto) references produto(idProduto)
);

-- criar tabela produtoPedido
create table produtoPedido(
	idPPpedido int,
    idPPproduto int ,
    ppQuantidade int default 1,
    ppStatus enum('Disponivel', 'Sem estoque') default 'Disponivel',
    primary key (idPPpedido, idPPproduto),
    constraint fk_produtopedido_vendedor foreign key(idPPproduto) references produto(idProduto),
    constraint fk_produtopedido_produto foreign key(idPPpedido) references pedido(idPedido)
);

-- criar tabela EstoqueProduto
create table estoqueProduto(
	idEPproduto int,
    idEPestoque int ,
    location varchar(255) not null,
    primary key (idEPproduto, idEPestoque),
    constraint fk_EPproduto foreign key(idEPproduto) references produto(idProduto),
    constraint fk_EPestoque foreign key(idEPestoque) references estoque(idEstoque)
);

create table produtoFornecedor(
	idPFfornecedor int,
	idPFproduto int,
    quantidade int not null,
    primary key(idPFproduto,idPFfornecedor),
    constraint fk_PFproduto foreign key(idPFproduto) references produto(idProduto),
    constraint fk_PFfornecedor foreign key(idPFfornecedor) references fornecedor(idFornecedor)
);

-- Inserindo os dados
use ecommerce;

show tables;

insert into cliente (Nome, SegundoNome, Sobrenome, CPF, Data_de_nascimento, Email, Telefone, UF, Cidade, bairro, CEP, rua, numero , complemento) 
		values ('Bruno', 'Soares', 'dos Santos', '13389012341', '1996-10-14', 'bruningostoso@gmail.com', '21999252698', 'RJ', 'Rio de Janeiro', 'Ipanema','20280150', 'avenida Atlantica', '100', 'apartamento:280, bloco:1'), 
			   ('Rosa', 'Soares', 'dos Santos', '13389012234', '1968-08-14', 'rosasoares@gmail.com', '21999259039', 'RJ', 'Rio de Janeiro', 'Ipanema','20280150', 'avenida Atlantica', '100', 'apartamento:280, bloco:1'), 
               ('Jorge', 'Soares', 'dos Santos', '15689012341', '1968-04-01', 'jorginho12@gmail.com', '21998312698', 'RJ', 'Rio de Janeiro', 'Ipanema','20280150', 'avenida Atlantica', '100', 'apartamento:280, bloco:1'), 
               ('Gabi', 'Soares', 'dos Santos', '13389012789', '1994-11-14', 'gabizinhhass@gmail.com', '32999252698', 'MG', 'Coimbra', 'Centro','32380150', 'avenida brasil', '15', null), 
               ('Pedrinho', 'Acorda', 'Campeonato', '56789012341', '2000-10-14', 'acordapedrinho@gmail.com', '15999252696', 'SP', 'Itapetininga', 'Vila João','15208033', 'avenida brasil', '33', 'casa dos fundos');

insert into produto (nome, categoria, descrição, valor, avaliação, dimensões) values
				('Cozinha Infantil Fogão','infantil','Cozinha Infantil Fogão Brinquedo Completa Pia Sai Água Interativa Grande - Pais&Filhos','116.94','4',null),
				('Moto Elétrica Infantil','infantil','Moto Elétrica Infantil Ban 2 Marchas 6V - Bandeirante','699','4.7',null),
				('Boneca Bebê Reborn','infantil','Boneca Bebê Reborn Gatinha De 55cm 100% Silicone Brastoy','273.54','4.8',null),
				('Cortina Roma Para Sala','outros','Cortina Roma Para Sala e Quarto 4,00 x 2,50 Admirare','109.16','4.2','4 x 2,50 m'),
				('Kit Com 04 Toalhas De Banho Gigante','Vestuário','Kit Com 04 Toalhas De Banho Gigante / Banhão Quasar - Verde/Rosa/Cinza/Azul - 75x150cm - Lmpeter','125.09','4.2','75 x 150 cm'),
				('Churrasqueira Elétrica Mondial','Eletrodomesticos','Churrasqueira Elétrica Mondial 1800W - Grand Steak & Grill','139.00','4.6',null),
				('Lavadora de Alta Pressão Electrolux','Eletrodomesticos','Lavadora de Alta Pressão Electrolux Powerwash Eco - EWS30 1800 Libras 1450W Mangueira 3m','479.90','4.7','1,5 x 1 x 1 m'),
				('Samsung Galaxy A13','Eletrônico','Smartphone Samsung Galaxy A13 128GB Azul 4G - Octa-Core 4GB RAM 6,6” Câm Quádrupla + Selfie 8MP','1214.10','4.8',null),
				('iPhone 11','Eletrônico','iPhone 11 Apple 64GB Branco 6,1” 12MP iOS','3254.07','4.9',null),
				('Geladeira/Refrigerador Brastemp','Eletrodomesticos','Geladeira/Refrigerador Brastemp Frost Free Duplex - Branca 375L BRM44 HBANA','2849.05','4.8','2 x 1 x 1 m'),
				('Lavadora de Roupas Electrolux','Eletrodomesticos','Lavadora de Roupas Electrolux LAC12 - 12Kg Cesto Inox 12 Programas de Lavagem','2059.00','4.8','1,5 x 1,5 x 1 m'),
				('Fogão de Piso 4 Bocas','Eletrodomesticos','FogAo de Piso 4 Bocas Esmaltec Bali Acendimento Manual 0104002103','479.00','4.6','1,5 x 1,5 x 1 m'),
				('Tênis Branco Feminino','Vestuário','Tênis Branco Feminino Vili Esportivo','86.39','4.7',null),
				('Bermuda Adidas','Vestuário','Bermuda Adidas 3S Masculina','57.69','4.9',null),
				('PlayStation 5','Eletrônico','PlayStation 5 825GB 1 Controle Branco Sony - com Horizon Forbidden West','4654.90','4.8',null),
				('Nintendo Switch','Eletrônico','Nintendo Switch OLED 64GB Branco 2 Controles - Joy-Con 7.0”','2564.05','4.9',null),
				('Xbox Series X','Eletrônico','Xbox Series X 2020 Nova Geração 1TB SSD - 1 Controle Preto Microsoft','4084.91','5.0',null),
				('Notebook Samsung Book','Eletrônico','Notebook Samsung Book Intel Core i7 8GB 256GB SSD - 15,6” Full HD Windows 11 NP550XDA-KU1BR','3959.10','4.7',null),
				('Álbum Copa do Mundo','outros','Álbum Copa do Mundo Box Exclusivo Capa Dura - Prata+ 50 Pacotes de Figurinhas Copa do Mundo 2022','244.90','4.4',null),
				('Box Livros J.K. Rowling','outros','Box Livros J.K. Rowling Edição Especial - Harry Potter Exclusivo','227.91','4.9',null),
				('Bolsa Feminina Luxuosa','Vestuário','Bolsa Feminina Luxuosa Grande Matelassê Alça Ombro Com Franja - Sobrinhos Moda','50.26','3.9',null),
				('Sandalia Feminina Salto Baixo','Vestuário','Sandalia Feminina Salto Baixo Grosso Confort Barato Via Angel 49.02','61.87','5.0',null),
				('Guarda-roupa Casal','outros','Guarda-roupa Casal com Espelho 4 Portas 4 Gavetas - Araplac Pequim','645.91','4.4',null),
				('Smart TV 65” Crystal 4K Samsung','Eletrônico','Smart TV 65” Crystal 4K Samsung 65AU7700 Wi-Fi - Bluetooth HDR Alexa Built in 3 HDMI 1 USB','3699.30','4.8','65"'),
                ('Doritos', 'Alimentos e bebidas', '1 pacote de biscoito doritos mexicano', 5.99, 4.9, null),
                ('Coca-cola', 'Alimentos e bebidas', '2L de coca cola zero, com figurinha da copa', 7.99, 4.8, null);


insert into pagamentoCartao(idCliente, tipoPagamento, nomeCartao, numeroCartao, bandeiraCartao, validade, codigoSegurança) values
				(1, 'Dois cartões', 'Ubiratan Jesus da Motta Filho','1234567891234567','VISA','2026-10-01','123'),
				(2,'Cartão', 'Vera Cristina Cordeiro da Motta','3216549879874568','VISA','2025-07-19','987'),
				(3,'Cartão', 'Henry Ubiratan Cordeiro da Motta','1478523698521478','MASTERCARD','2024-08-21','123'),
				(4,'Cartão', 'Milton Nascimento','3698521478954123','MASTERCARD','2028-12-10','321'),
				(5,'Cartão', 'Tom Jobim','9856745812563458','MASTERCARD','2023-05-20','159'),
				(1,'Cartão', 'Edson Arantes do Nascimento','9854965874125632','ELO','2022-12-10','236'),
				(2,'Cartão', 'Emilio Santiago','2135549628414384','ELO','2026-05-21','325'),
				(3,'Cartão', 'Joaquim Maria Machado de Assis','1345649846315489','ELO','2025-06-15','111'),
				(4,'Cartão', 'Hilária Batista de Almeida','1565435748696854','HIPERCARD','2030-09-20','123'),
				(5,'Cartão', 'Carolina Maria de Jesus','1354897658451354','AMERICAN EXPRESS','2028-12-16','332'),
				(1,'Cartão', 'Sebastião Bernardes de Souza Prata','1653548794161268','MAESTRO','2026-10-18','442');


    
desc pedido;

insert into pedido(idPedidoClient, idPagamento, pedidoStatus, DescriçãoPedido, valorFrete, boletoOuPix) values
				('1','1','Cancelado','Compra pelo site', '1', true),
				('2','2','Cancelado','Compra pelo Aplicativo', '0', true),
				('3','3','Cancelado','Compra pelo site', '10', false),
				('5','4','Confirmado','Compra pelo site', '0', false),
				('1','5','Em processamento','Compra pelo site', '20', false),
				('2','6','Em processamento','Compra pelo Aplicativo', '0', false),
				('3','7','Confirmado','Compra pelo Aplicativo', '5', false),
				('4','8','Em processamento','Compra pelo site', '2', false),
				('4','9','Em processamento','Compra pelo site', '10', false),
				('5','10','Em processamento','Compra na Loja', '10', false),
				('1','11','Em processamento','Compra na Loja', '1', false),
				('2','1','Em processamento','Compra pelo site', '2', false),
				('3','3','Confirmado','Compra pelo site', '0', false),
				('4','4','Confirmado','Compra pelo site', '0', false),
				('5','5','Confirmado','Compra pelo site', '0', false);


insert into estoque (localização, nome_responsavel, email, telefone, quantidade) values
				('Curitiba','Pedro Souza','cd-curitiba@estoque.com','41998569632','200'),
				('Rio de Janeiro','João da Silva','cd-riodejaneiro@estoque.com','21998548962','300'),
				('São Paulo','Jose dos Flores','cd-saopaulo@estoque.com','11985478596','400');


insert into fornecedor (RazãoSocial, NomeFantasia, CNPJ, endereçoFornecedor, email, telefone) values
				('Fornecimento Ilimitado Ltda','Ilimitado','10152325000115','Rua Zumbi dos Palmares, Curitiba - Paraná / Brasil','contato@ilimitado.com.br','41998887445'),
				('Eletronicos Brasil SA.','Brasa Eletronicos','51258659000132','Rua Tia Ciata, Rio de Janeiro - Rio de Janeiro / Brasil','contato@brasaeletronico.com.br','21985554775'),
				('Moveis do Brasil Ltda','Movil Moveis','26159847000119','Avenida Tom Jobim, São Paulo - São Paulo / Brasil ','contato@movilmoveis.com','11905515454'),
				('Celulares e Comunicação Ltda','CelCom Brasil','95259132000120','Avenida Engenheiro Rebouças, Curitiba - Paraná / Brasil ','contato@celcom.com.br','41998552364');



desc vendedor;
insert into vendedor (RazãoSocial, NomeFantasia, CNPJ, CPF, endereço, email, telefone) values
				('Vendas de Eletronicos e variados','Vendas & Vendas','12159158000125', '18389012390','Curitiba','bruno@vendasvendas.com','41987456321'),
				('Brinquedos Infantis Ltda','Brinquedos e Cia','48159357000137','19989012390','São Paulo ','aldemarmaroto@brinquedos.com','11985258741'),
				('Ferramentas Gerais de Operações AS','FERGERO','1313254800131','18389000090','Rio de Janeiro','antonio@fergero.com.br','21905412563');

-- Produto Pedido
insert into produtoPedido (idPPpedido, idPPproduto , ppQuantidade, ppStatus) values
				(5,1,1,'Sem estoque'),
				(5,2,1,'Sem estoque'),
				(1,3,2,'Sem estoque'),
				(2,4,2,'Disponivel'),
				(3,4,1,'Disponivel'),
				(4,4,2,'Disponivel'),
				(1,5,2,'Disponivel'),
				(5,6,3,'Disponivel'),
				(4,6,1,'Disponivel'),
				(3,6,1,'Disponivel'),
				(3,7,1,'Disponivel'),
				(4,7,5,'Disponivel'),
				(2,8,1,'Disponivel'),
				(1,9,1,'Disponivel'),
				(1,2,1,'Disponivel'),
				(1,10,1,'Disponivel'),
				(2,11,1,'Disponivel'),
				(2,3,1,'Disponivel'),
				(3,11,1,'Disponivel'),
				(4,1,2,'Disponivel'),
				(4,12,1,'Disponivel'),
				(5,13,1,'Disponivel'),
				(4,13,1,'Disponivel'),
				(5,14,1,'Disponivel'),
				(5,4,2,'Disponivel'),
				(2,15,2,'Disponivel');

insert into entrega (idEntregaPedido, codigoRastreio, statusEntrega, prazoEntrega) values
				('1','A100001','CDD','2022-10-25'),
				('2','A100002','CDD','2022-10-31'),
				('2','A100003','CDD','2022-10-24'),
				('4','A100004','saiu para entrega','2022-10-27'),
				('4','B200001','saiu para entrega','2022-10-25'),
				('3','B200002','saiu para entrega','2022-10-22'),
				('1','B200003','entregando','2022-10-21'),
				('3','B200004','entregando','2022-10-21'),
				('1','C300001','entregando','2022-10-22'),
				('2','C300002','saiu para entrega','2022-10-20'),
				('1','C300003','CDD','2022-10-20'),
				('4','C300004','entregando','2022-10-20'),
				('2','D400001','entregue','2022-10-10'),
				('3','D400002','entregue','2022-10-07'),
				('1','D400003','entregue','2022-10-05');

insert into produtoVendedor(idProdutoVendedor, idProdutoProduto, quantidade) values
				(1,5,5),
				(2,6,2),
				(3,1,5),
				(1,2,1),
				(2,3,2),
				(3,2,1),
				(1,6,6),
				(2,5,1),
				(3,4,1);

insert into produtoFornecedor(idPFfornecedor, idPFproduto, quantidade) values
				(1,1,1),
				(1,2,10),
				(1,3, 2),
				(2,4, 20),
				(2,5, 7),
				(2,6, 23),
				(3,7, 25),
				(3,8, 5),
				(3,9, 6),
				(4,10, 29),
				(4,11, 40),
				(4,13, 30);

    
insert into estoqueProduto(idEPproduto, idEPestoque, location) values
				(1,2,'RJ'),
				(2,2,'MG'),
				(3,2,'SP'),
				(4,2,'AC'),
				(5,2,'RN'),
				(6,2,'BA'),
				(7,2,'MT'),
				(8,2,'MS'),
				(9,1,'RS'),
				(10,3,'BH'),
				(11,3,'ES'),
				(11,1,'RR'),
				(1,1,'AM'),
				(2,3,'RJ'),
				(12,3,'RJ'),
				(13,3,'RJ'),
				(14,1,'RJ'),
				(15,2,'RJ'),
				(12,1,'RJ'),
				(20,2,'RJ'),
				(3,3,'RJ'),
				(3,1,'RJ'),
				(4,1,'RJ'),
				(18,1,'RJ'),
				(19,1,'RJ');

                
                
                
-- Realizando consultas SQL

-- Conta a quantidade de clientes 
select count(*) from cliente;

-- Mostra todas as informação de clientes com seus respectivos pedidos
select * from cliente c, pedido p where c.idClient = idPedidoClient;

-- Mostra o status dos pedidos de todos os pedidos com o nome do cliente
select concat(Nome,' ', SegundoNome) as cliente, idPedido, pedidoStatus from cliente c, pedido p where c.idClient = idPedidoClient;

-- Mostr oa pedidos dos clientes agrupando pela identificação do cliente
select * from cliente c inner join pedido p on c.idClient = p.idPedidoClient
		inner join produtoPedido pp on pp.idPPpedido = p.idpedido
	group by idClient;
    

-- Quanto pedidos foram realizados pelos clientes?
select c.idClient, Nome, count(*) as Numero_pedidos from cliente c
		inner join pedido p on c.idClient= p.idPedidoClient
	group by idClient;

-- Quais os clientes que mais gastam e menos ?
select concat(c.Nome,' ', c.SegundoNome) as cliente, sum(r.valor * pp.ppQuantidade) as 'Valor total' from cliente c
		inner join pedido p on c.idClient= p.idPedidoClient
        inner join produtoPedido pp on p.idPedidoClient = pp.idPPpedido
        inner join produto r on pp.idPPproduto = r.idProduto
	group by idClient
    order by sum(r.valor * pp.ppQuantidade);

-- Veja como está o status de uma entrega para um cliente em SP:
select c.Nome, c.UF, e.statusEntrega, p.DescriçãoPedido from cliente c
	inner join pedido p on c.idClient= p.idPedidoClient
    inner join entrega e on p.idPedido = e.idEntregaPedido
    where c.UF='SP';

-- Ver quais os produtos estão com o estoque do fornecedor  baixo, menor do que 10:
select p.nome, f.NomeFantasia, pf.quantidade from  produto p
	inner join produtoFornecedor pf on p.idProduto = pf.idPFproduto
    inner join fornecedor f on pf.idPFfornecedor = f.idFornecedor
	having sum(pf.quantidade<10);
