---tudo sobre a tabela
EXEC sp_help'tb_produtos'

SELECT 
COLUMN_NAME, 
DATA_TYPE, 
CHARACTER_MAXIMUM_LENGTH, 
IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tb_pedidos';

---Chave primaria da tabela---
EXEC sp_pkeys 'tb_pedidos'
---chave estrangeira
EXEC sp_fkeys 'tb_pedidos'

--- ver todas as tabelas do banco de dados
SELECT name
FROM SYS.TABLES
ORDER BY name; 

---ver distribuição de valores
--- ex. por cidade ou estado
SELECT cidade, COUNT(*) AS total
FROM tb_enderecos
GROUP BY cidade
ORDER BY total DESC;

SELECT uf, COUNT(*) AS total
FROM tb_enderecos
GROUP BY uf
ORDER BY total DESC;