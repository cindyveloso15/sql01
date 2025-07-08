USE bd_16_byciclon

SELECT c.nome, c.email, e.uf, e.cidade
FROM tb_cliente c
JOIN tb_enderecos e ON c.idendereco = e.idendereco
where e.uf = 'SP';

---Pedidos com o valor acima de 3000
SELECT p.idpedido, p.datapedido AS calendario,c.nome 
AS CLIENTE, p.valortotal
FROM tb_pedidos p
JOIN tb_cliente c ON p.idcliente = c.idcliente
WHERE p.valortotal>1000

---Produtos da linha mtb
SELECT nome, linha, valorunitario
FROM tb_produtos
WHERE linha = 'MTB';

---clientes que começam com a letra 'C'
SELECT nome, email
FROM tb_cliente
WHERE nome LIKE 'C%'

---pedidos feitos entre duas datas
SELECT idpedido, datapedido, valortotal 
FROM tb_pedidos
---WHERE datapedido BETWEEN '2024-06-01' AND '2025-08-01';

--- VER ITENS DE UM PEDIDO ESPECIFICO
SELECT 
p.idpedido AS CodPedido, 
pr.nome AS Produto, 
i.quantidade, 
i.precounitario, 
i.desconto
FROM tb_itenspedidos i
JOIN tb_pedidos p ON i.idpedido = p.idpedido
JOIN tb_produtos pr ON i.idproduto = pr.idproduto
WHERE p.idpedido = 1

---lista de vendedores e suas regiões
SELECT
	v.nome AS Vendedor,
	v.email AS Email,
	r.nomeregional AS Regiao
from tb_vendedores v
JOIN tb_regional r ON v.idregional = r.idregional;

--- Clientes e seus respectivos vendedores (por pedido)
SELECT c.nome AS Cliente, v.nome AS vendedor, p.datapedido
FROM tb_pedidos p
JOIN tb_cliente c on p.idcliente = c.idcliente
JOIN tb_vendedores v on p.idvendedor = v.idvendedor

---produtos com valor entre 2000 e 3000

SELECT nome, valorunitario
FROM tb_produtos
WHERE valorunitario BETWEEN 2000 AND 3000;