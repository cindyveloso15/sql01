--- criar o banco de dados
CREATE DATABASE bd_16_byciclon
GO
USE bd_16_byciclon
GO

--- criar a tabela tb_cliente

CREATE TABLE tb_cliente(
	idcliente INT PRIMARY KEY IDENTITY(1,1), --- coluna numerica tipo autonumeração
	idendereco INT NOT NULL, --- campo numerico para FK
	idregional INT NOT NULL, --- campo numerico para FK
	nome VARCHAR(40) not null, -- campo campo texto
	email VARCHAR(40) NOT NULL, --- campo texto
	cpf VARCHAR(11) NOT NULL
);

CREATE TABLE tb_vendedores(
	idvendedor INT PRIMARY KEY IDENTITY(1,1),
	idendereco INT NOT NULL, 
	idregional INT NOT NULL,
	nome VARCHAR(40) NOT NULL, 
	email VARCHAR(30) NOT NULL,
	cpf VARCHAR(11) NOT NULL
);

CREATE TABLE tb_produtos(
	idproduto INT PRIMARY KEY IDENTITY(1,1),
	nome  VARCHAR(255) NOT NULL,
	linha VARCHAR(255),
	valorunitario MONEY NOT NULL
);

CREATE TABLE tb_pedidos(
	idpedido INT PRIMARY KEY IDENTITY(1,1),
	idcliente INT NOT NULL,
	idvendedor INT NOT NULL,
	datapedido DATE NOT NULL, 
	qtditens INT NOT NULL,
	valortotal MONEY NOT NULL
);

CREATE TABLE tb_itenspedidos(
	iditempedido INT PRIMARY KEY IDENTITY(1,1),
	idpedido INT NOT NULL,
	idproduto INT NOT NULL,
	quantidade INT NOT NULL, 
	precounitario MONEY NOT NULL,
	desconto MONEY NOT NULL
);

CREATE TABLE tb_regional(
	idregional INT PRIMARY KEY IDENTITY(1,1),   
	nomeregional VARCHAR(50) NOT NULL, 
	enderecoregional VARCHAR(255), 
	telefoneregional VARCHAR(50)
);

CREATE TABLE tb_enderecos(
	idendereco INT PRIMARY KEY IDENTITY(1,1),   
	pais VARCHAR(50),
	uf VARCHAR(50)NOT NULL,
	cidade VARCHAR(50)NOT NULL,
	bairro VARCHAR(50)NOT NULL,
	rua VARCHAR(50)NOT NULL,
	numero INT NOT NULL
);

CREATE TABLE temporaria(
	coluna	INT,
	coluna02 INT
);