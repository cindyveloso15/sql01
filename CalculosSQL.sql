---Tabelas do Banco de dados
USE bd_16_byciclon	

SELECT name FROM sys.tables ORDER BY name;

---campos da tabela de pedidos
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tb_pedidos'

--- Total de clientes por estado
SELECT e.uf, COUNT(*) as total_clientes
FROM tb_cliente c
JOIN tb_enderecos e ON c.idendereco = e.idendereco
GROUP BY e.uf
ORDER BY total_clientes DESC;

--- Nome dos clientes e valor total que cada um ja gastou
SELECT 
	c.nome AS Cliente,
	SUM(p.valortotal) As TotalGasto
From tb_cliente c
JOIN tb_pedidos p ON c.idcliente = p.idcliente
GROUP BY c.nome
ORDER BY Totalgasto DESC;

--- valor total de pedidos por cliente e estatisticas de calculo
SELECT
	c.nome AS Cliente,
	SUM(p.valortotal) AS TotalGasto, 
	AVG(p.valortotal) AS MediaPorPedido,
	MIN(p.valortotal) AS pedidomaisbarato,
	MAX(p.valortotal) AS pedidomaiscaro
FROM tb_cliente
JOIN tb_pedidos p ON c.idcliente = p.idcliente
GROUP BY c.nome

---Pedidos por mês com media de valor
--- para ano uso year() e para dia uso day()
SELECT
	MONTH(datapedido) AS Mes,
	COUNT (*) AS TotaldePedidos,
	AVG(valortotal) AS MedidaPedido
FROM tb_pedidos
GROUP BY MONTH(datapedido)
ORDER BY MES;

SELECT TOP 3
 c.nome AS Cliente,
 SUM(p.valortotal) AS 'Total Gasto'
FROM tb_cliente c
JOIN tb_pedidos p ON c.idcliente = p.idcliente
GROUP BY c.nome
ORDER BY 'Total Gasto' DESC;


/*qual maior cliente que comprou maior numero de produtos no mês passado, e qto ele
gastou no total?*/

SELECT TOP 1
	c.nome AS Cliente,
	SUM(i.quantidade) AS TotalProdutosComprados,
	FORMAT(SUM((i.precounitario * i.quantidade) - i.desconto),'C','pt-br') 
	AS TotalGasto
FROM tb_pedidos p
JOIN tb_cliente c ON p.idcliente = c.idcliente
JOIN tb_itenspedidos i ON p.idpedido = i.idpedido
WHERE
	p.datapedido BETWEEN '2020-07-01' AND '2026-07-30'  
GROUP BY c.nome
ORDER BY TotalProdutosComprados DESC;

---Listar todas FK de uma tabela (modo pratico) --- ou o nome da tabela com problema
EXEC sp_fkeys 'tb_cliente';
EXEC sp_fkeys 'tb_itenspedidos';
EXEC sp_fkeys 'tb_pedidos';
EXEC sp_fkeys 'tb_enderecos';

---VER NOME DASCONSTRAINTS NO BANCO DE DADOS INTEIRO
SELECT
	f.name AS 'Nome Constraint',
	OBJECT_NAME(f.parent_object_id) AS Tabela,
	COL_NAME(fc.parent_object_id, fc.parent_column_id) AS Coluna
	FROM sys.foreign_keys AS f
	INNER JOIN sys.foreign_key_columns AS fc
		ON f.object_id = fc.constraint_object_id
	ORDER BY Tabela

--- Excluir a constraint (chave estrangeira incorreta)
ALTER TABLE tb_pedidos --- substitua pela tabela com a constraint errada
DROP CONSTRAINT fk_itenspedidos_pedidos --- SUBSTITUA PELA CONSTRAINT ERRADA

select * from tb_produtos
select * from tb_itenspedidos

EXEC sp_fkeys @fktable_name ='tb_itenspedidos';
EXEC sp_fkeys @fktable_name ='tb_pedidos';

SELECT * FROM tb_itenspedidos WHERE idpedido NOT IN
(SELECT idpedido FROM tb_pedidos);

DELETE FROM tb_itenspedidos where idpedido NOT IN
(SELECT idpedido FROM tb_pedidos);