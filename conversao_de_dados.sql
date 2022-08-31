SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%m/%y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y - %U'), "ª semana do ano" ) AS RESULTADO;

SELECT CONVERT(23.3, CHAR) AS RESULTADO;
--  SUBSTRING(string, de, até)
SELECT SUBSTRING(CONVERT(23.5, CHAR),1,2) AS RESULTADO;

-- Queremos construir um SQL cujo resultado seja, para cada cliente:
-- “O cliente João da Silva faturou 120000 no ano de 2016”.
-- Somente para o ano de 2016.

SELECT distinct NOME, VOLUME_DE_COMPRA, YEAR(DATA_VENDA) FROM tabela_de_clientes cli inner join notas_fiscais nota
on cli.CPF = nota.CPF
WHERE YEAR(DATA_VENDA) = 2016;

-- TENTATIVA
SELECT CONCAT('O cliente ', NOME, ' faturou ', sum(VOLUME_DE_COMPRA), ' no ano de ',
YEAR(DATA_VENDA)) AS FATURA_CLIENTE FROM tabela_de_clientes cli inner join notas_fiscais nota
on cli.CPF = nota.CPF WHERE YEAR(DATA_VENDA) = 2016 GROUP BY YEAR(DATA_VENDA) = 2016;

-- CORRECAO:
SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20)),
' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA);

-- correção no FORUM
SELECT CONCAT('O(A) cliente ', NOME, ' faturou R$', ROUND(SUM(QUANTIDADE*PRECO),2),
' no ano de 2016.') RESULTADO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC 
ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016 GROUP BY NF.CPF;