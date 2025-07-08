USE bd_16_byciclon
INSERT INTO tb_enderecos(pais,uf,cidade,bairro,rua,numero)VALUES
('Brasil','SP', 'Osasco','Centro','Rua das Camélias',100),
('Brasil','SP', 'São Paulo','Bela Vista','Rua Brigadeiro Luis Antonio',1001);


INSERT INTO tb_regional(nomeregional,enderecoregional,telefoneregional)VALUES
('Sudeste','Av Paulista 1439','12341234'),
('Norte','Av dos Cravos','44441234');

INSERT INTO tb_cliente(idendereco,idregional,nome,email,cpf)VALUES
(1,1,'Camelia','camelia@gmail.com','123456789'),
(2,2,'Gustavo','gus12@gmail.com','123456788');

INSERT INTO tb_vendedores(idendereco,idregional,nome,email,cpf)VALUES
(2,1,'Fabio','fabiods@gmail.com','323456789'),
(2,1,'Marta','gus12@gmail.com','623456788');

INSERT INTO tb_produtos(nome,linha,valorunitario)VALUES
('Mountain Bike','mtb',3500.90),
('Caloi Ceci','Speed',2800.00),
('Baarra Forte','MTB',4000.10);

INSERT INTO tb_pedidos(idpedido,idcliente, idvendedor, datapedido,qtditens,valortotal)VALUES
(1,1,1,'2025-07-20',2,5000),
(2,2,2,'2025-07-21',1,5000);


INSERT INTO tb_itenspedidos(iditempedido,idpedido,idproduto,quantidade,precounitario,desconto)VALUES
(1,2,1,1,3600.00,0),
(2,2,1,1,9000.00,0);


