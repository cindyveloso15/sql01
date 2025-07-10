/*
adicionar uma coluna nova na tabela tb_produtos
essa coluna ser chamará estoque*/
USE bd_16_byciclon

--- INSERE UMA COLUNA DE ESTOQUE COM VALOR PADRAO EM ZERO
ALTER TABLE tb_produtos
ADD estoque INT DEFAULT 0;

---VER PRODUTOS DENTRO DA TABELA
SELECT * FROM tb_produtos

---atualizar os valores da tabela de produto
UPDATE tb_produtos SET estoque = 15 WHERE nome ='Caloi Ceci';
UPDATE tb_produtos SET estoque = 13 WHERE nome ='Mountain Bike'


--- confirmar dados atualizados
SELECT * FROM tb_produtos

--- traz o total de valor em estoque multiplicando a quantidade de valor 

SELECT 
	nome,
	valorunitario,
	estoque,
	(valorunitario*estoque) AS valortotalestoque
FROM tb_produtos

--- exercicio 
---INSERIR UMA NOVA BICICLETA
INSERT INTO tb_produtos (nome,linha,valorunitario)
values('COLUMBIA PIC','SPEED',6000.00);

---ATUALIZAR O ESTOQUE DA BICICLETA RECEM ADQUIRIDA
UPDATE tb_produtos SET estoque = 10
WhERE nome = 'COLUMBIA PIC'

INSERT INTO tb_produtos (nome,linha,valorunitario)
values('MIKE BIKER','MTB',3500.00);

---SÓ SE FOR IMEDIATAMENTE APÓS O INSERT

DECLARE @ID INT = SCOPE_IDENTITY();
UPDATE tb_produtos SET estoque = 19
where idproduto = @ID;

SELECT
	nome,
	valorunitario,
	estoque,
	(valorunitario * estoque) AS ValorTotal,
	(valorunitario * estoque) * 0.05 AS Desconto5porCento,
	(valorunitario * estoque) * 0.95 AS ValorFinalComDesconto
FROM tb_produtos 
WHERE nome = 'MIKE BIKER';

--- SELEC COM FORMAT E JOIN REALIZANDO CALCULOS
SELECT
	i.idpedido,
	p.nome AS Produto,
	i.quantidade,
	FORMAT(i.precounitario,'C','pt-br') AS PrecoUnitario,
	FORMAT(i.desconto,'C','pt-br')AS Desconto,
	FORMAT((i.quantidade * i.precounitario)-i.desconto,'C','pt-br') AS ValorF
FROM tb_itenspedidos i
JOIN tb_produtos p ON i.idproduto = p.idproduto

SELECT * FROM tb_itenspedidos

UPDATE tb_itenspedidos SET desconto = 200 WHERE iditempedido = 1

---Define um desconto de 10% globalmente
DECLARE @descontoGlobal DECIMAL(5,2) = 0.10;
SELECT
	nome,
	FORMAT(valorunitario,'C','pt-br') AS Valorunitario,
	estoque,
	FORMAT(valorunitario * estoque, 'C','pr-br') AS TotalBruto,
	FORMAT (valorunitario * estoque *(1 - @descontoGlobal),'C','pt-br') AS TotalComDesconto
FROM tb_produtos

--- trabalhar com case
SELECT 
	nome,
	valorunitario,
	CASE
		WHEN valorunitario >= 4000THEN 'PREMIUM'
		WHEN valorunitario >= 3500THEN 'INTERMEDIARIA'
		ELSE 'BASICO'
	END AS CATEGORIA
FROM tb_produtos

--- traz os itens que estão com estoque baixo
SELECT nome, estoque FROM tb_produtos WHERE estoque < 15;

SELECT * FROM tb_produtos

DELETE FROM tb_produtos WHERE idproduto = 1

--- apaga somente se existir o valor a ser apagado
IF EXISTS (SELECT 1 FROM tb_produtos WHERE idproduto = 3)
DELETE FROM tb_produtos WHERE idproduto = 3

--- Apagar tabela em MODO DESTRUTIVO
--- DROP TABLE tb_produtos

--- apagar em modo seguro
/*IF OBJECT_ID('tb_produtos','U') IS NOT NULL
	DROP TABLE tb_produtos;
*/


---APAGAR MEU PRIMEIRO BANCO
DROP DATABASE meuprimeirobanco

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'db_pedidos')
	DROP DATABASE db_pedidos


USE master;


