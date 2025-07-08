---remover uma coluna da tabela

USE bd_16_byciclon
-- consulta as colunas da tabela
SELECT * FROM temporaria;
-- remover uma coluna da tabela
ALTER TABLE temporaria
DROP COLUMN coluna02 
---consultar agora as alterações
select * from temporaria;
---excluir a tabela temporaria
DROP TABLE temporaria

--- SELECT idendereco 
---FROM tb_cliente 
---WHERE idendereco NOT IN (SELECT idendereco FROM tb_enderecos)

---SELECT idpedido 
---FROM tb_itenspedidos
WHERE idpedido NOT IN (SELECT idpedido FROM tb_pedidos)

---SELECT idpedido 
---FROM tb_itenspedidos
---WHERE idpedido NOT IN (SELECT idpedido FROM tb_pedidos)