USE sucos_vendas;

select distinct bairro from tabela_de_clientes;

select distinct bairro from tabela_de_vendedores;

select distinct bairro from tabela_de_clientes
UNION
select distinct bairro from tabela_de_vendedores;

select distinct bairro from tabela_de_clientes
UNION ALL
select distinct bairro from tabela_de_vendedores;

select distinct BAIRRO, NOME, 'CLIENTE' AS TIPO from tabela_de_clientes
UNION ALL
select distinct BAIRRO, NOME, 'VENDEDOR' AS TIPO  from tabela_de_vendedores;

--ERRO PQ NÃO TEM O MESMO NÚMERO DE COLUNAS
select distinct BAIRRO, NOME, 'CLIENTE' AS TIPO, CPF from tabela_de_clientes
UNION ALL
select distinct BAIRRO, NOME, 'VENDEDOR' AS TIPO  from tabela_de_vendedores;

select distinct BAIRRO, NOME, 'CLIENTE' AS TIPO, CPF AS 'CPF/MATRICULA' from tabela_de_clientes
UNION ALL
select distinct BAIRRO, NOME, 'VENDEDOR' AS TIPO, MATRICULA  from tabela_de_vendedores;

-- GAMBIARRA PARA IMPLEMENTAR O FULL JOIN
select tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME as 'VENDEDOR', 
tabela_de_clientes.BAIRRO, tabela_de_clientes.nome AS 'CLIENTE'
from tabela_de_vendedores LEFT join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
select tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME as 'VENDEDOR', 
tabela_de_clientes.BAIRRO, tabela_de_clientes.nome AS 'CLIENTE'
from tabela_de_vendedores right join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

