--- Criando meu primeiro banco de dados
/*comentario
de
varias 
linhas
*/


create database db_16_cadastro;

use db_16_cadastro;

--- Criando a tabela pessoas
create table tb_pessoas(
	--- não preciso identar
	id_pessoas int identity (1,1) primary key, 
	nome varchar(50) not null, 
	idade varchar(3) not null,
	uf char (2) not null);

--- Inserindo Registros na Tabela
insert into tb_pessoas (nome,idade,uf)
values ('Cindy',44,'sp')

insert into tb_pessoas (nome, idade, uf)
values ('Caio',22,'al')

insert into tb_pessoas (nome, idade, uf)
values ('Isabella', 17,'rj')

insert into tb_pessoas (nome, idade, uf)
values ('Rodrigo', 18,'sp')

insert into tb_pessoas (nome, idade, uf)
values ('Gabriel', 19,'df')

insert into tb_pessoas (nome, idade, uf)
values ('Andressa', 20,'ba')

--- mostra os dados que a tabela possui
select * from tb_pessoas

alter table tb_pessoas add cidade varchar(30);
alter table tb_pessoas drop column cidade