select 
	p.id_pedido,
	p.descricao,
	p.valor,
	c.id_cliente,
	c.nome,
	c.cidade
from
	tb_pedidos p
join
	tb_clientes c ON fk_cliente = c.id_cliente
order by c.nome;

---select * from tb_clientes
---select * from tb_pedidos
