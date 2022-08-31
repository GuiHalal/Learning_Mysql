--Exemplos de LEFT e RIGHT JOIN

use sucos_vendas;
select count(*) from tabela_de_clientes;

select CPF, COUNT(*) FROM notas_fiscais group by CPF;

select distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
INNER JOIN notas_fiscais B ON A.CPF = B.CPF;

select distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
left JOIN notas_fiscais B ON A.CPF = B.CPF;

select distinct A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A 
left JOIN notas_fiscais B ON A.CPF = B.CPF where B.CPF IS NULL;