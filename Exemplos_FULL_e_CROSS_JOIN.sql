use sucos_vendas;

select * from tabela_de_vendedores;

select * from tabela_de_clientes;

select * from tabela_de_vendedores inner join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select count(*) from tabela_de_clientes;

select tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO, tabela_de_clientes.nome from tabela_de_vendedores inner join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO, tabela_de_clientes.nome 
from tabela_de_vendedores left join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME as 'VENDEDOR', 
tabela_de_clientes.BAIRRO, tabela_de_clientes.nome AS 'CLIENTE'
from tabela_de_vendedores right join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME as 'VENDEDOR', 
tabela_de_clientes.BAIRRO, tabela_de_clientes.nome AS 'CLIENTE'
from tabela_de_vendedores CROSS join tabela_de_clientes;

-- FULL JOIN NÃO ESTA DISPONÍVEL NO MYSQL
select tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME as 'VENDEDOR', 
tabela_de_clientes.BAIRRO, tabela_de_clientes.nome AS 'CLIENTE'
from tabela_de_vendedores FULL join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

