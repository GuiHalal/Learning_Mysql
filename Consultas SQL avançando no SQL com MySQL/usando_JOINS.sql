use sucos_vendas;

select * from tabela_de_vendedores;

select * from notas_fiscais;

select * from tabela_de_vendedores A inner join notas_fiscais B
	on A.MATRICULA = B.MATRICULA;
    
select A.MATRICULA, A.NOME, count(*) AS 'NOTAS EMITIDAS' from tabela_de_vendedores A 
inner join notas_fiscais B on A.MATRICULA = B.MATRICULA
group by A.MATRICULA, A.NOME;

-- MESMO RESULTADO, MAS EM DESUSO
SELECT 
    A.MATRICULA, A.NOME, COUNT(*) AS 'NOTAS EMITIDAS'
FROM
    tabela_de_vendedores A,
    notas_fiscais B
WHERE
    A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA , A.NOME;

-- Obtenha o faturamento anual da empresa. 
-- Leve em consideração que o valor financeiro das vendas consiste em multiplicar 
-- a quantidade pelo preço.

-- TENTATIVA
SELECT * FROM notas_fiscais A INNER JOIN itens_notas_fiscais B ON A.NUMERO = B.NUMERO 
WHERE YEAR(A.DATA_VENDA)=2017;

-- CORREÇÃO
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

-- REFLEXÃO
	-- SUM(QUANTIDADE * PRECO):  NÃO PRECISA ESPECIFICAR DE QUE TABELA É A COLUNA SE NÃO TEM NOME REPETIDO
	-- notas_fiscais NF INNER JOIN itens_notas_fiscais INF: ESSE JOIN SERVE PRA JUNTAR A DATA 
	--  DE UMA TABELA E OS DADOS DE VENDAS DA OUTRA
    -- ENQUANTO 'WHERE YEAR(A.DATA_VENDA)=2017;' LIMITA O ANO EM 2017 'GROUP BY YEAR(DATA_VENDA)'
    --  RETORNA PRA TODOS OS ANOS, MAS TEM QUE CONSTAR NO 'SELECT'