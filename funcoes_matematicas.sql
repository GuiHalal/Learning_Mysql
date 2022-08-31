-- Funções matemáticas
USE sucos_vendas;

SELECT(23+(45*32)/2)-2 AS REULTADO;

select sqrt(4);

SELECT ceiling(PI()) AS REULTADO;

SELECT round(PI()) AS REULTADO;

SELECT FLOOR(PI()) AS REULTADO;

SELECT round(PI()) AS REULTADO;

select RAND()*100 AS ALEATORIO;

SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE * PRECO AS FATURAMENTO FROM itens_notas_fiscais;

SELECT NUMERO, QUANTIDADE, PRECO, round(QUANTIDADE * PRECO, 2) AS FATURAMENTO FROM itens_notas_fiscais;

-- Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos a quantidade e o faturamento. 
-- Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.

SELECT QUANTIDADE, PRECO, IMPOSTO, (QUANTIDADE * PRECO * IMPOSTO) AS IMPOSTO_POR_ITEM
FROM itens_notas_fiscais A INNER JOIN notas_fiscais B 
ON B.NUMERO = A.NUMERO WHERE year(DATA_VENDA)=2016;


SELECT YEAR(DATA_VENDA) AS DATA_VENDA, FLOOR(SUM((QUANTIDADE * PRECO * IMPOSTO))) AS IMPOSTO_2016
FROM itens_notas_fiscais A INNER JOIN notas_fiscais B 
ON B.NUMERO = A.NUMERO WHERE year(DATA_VENDA)=2016
GROUP BY YEAR(DATA_VENDA);


SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA)