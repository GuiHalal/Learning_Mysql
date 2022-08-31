
SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;

SELECT * FROM notas_fiscais nf 
INNER JOIN
itens_notas_fiscais inf
on
nf.NUMERO = inf.NUMERO;

SELECT NF.CPF, date_format(NF.DATA_VENDA, '%y-%m') AS DATA_VENDA, INF.QUANTIDADE FROM notas_fiscais NF 
INNER JOIN
itens_notas_fiscais INF
on
NF.NUMERO = INF.NUMERO;

SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM notas_fiscais NF 
INNER JOIN
itens_notas_fiscais INF
on
NF.NUMERO = INF.NUMERO;

/* CONSULTA COM VENDAS POR CLIENTE POR MES */
SELECT NF.CPF, date_format(NF.DATA_VENDA, '%y-%m') AS DATA_VENDA, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS 
FROM notas_fiscais NF 
INNER JOIN
itens_notas_fiscais INF
on
NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, date_format(NF.DATA_VENDA, '%y-%m');

/* LIMITE VENDAS POR CLIENTE */

select * from tabela_de_clientes TC;

select TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM tabela_de_clientes TC;

SELECT NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%y-%m') AS DATA_VENDA, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
FROM notas_fiscais NF
INNER JOIN
itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, date_format(NF.DATA_VENDA, '%y-%m'), TC.NOME, TC.VOLUME_DE_COMPRA;


SELECT X.CPF, X.NOME, X.DATA_VENDA, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,

CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA
FROM(
SELECT NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%y-%m') AS DATA_VENDA, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
FROM notas_fiscais NF
INNER JOIN
itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, date_format(NF.DATA_VENDA, '%y-%m'), TC.NOME, TC.VOLUME_DE_COMPRA
) X;

SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE 
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA' 
END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;

 /*
 Nesta aula construímos um relatório que apresentou os clientes que tiveram vendas inválidas. 
 Complemente este relatório listando somente os que tiveram vendas inválidas e calculando 
 a diferença entre o limite de venda máximo e o realizado, em percentuais.

 Dica:

Capture a SQL final da aula.

Filtre somente as linhas onde

(X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0

Liste a coluna de X.QUANTIDADE_LIMITE

Crie uma nova coluna fazendo a fórmula:

(1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100
*/

SELECT X.CPF, X.NOME, X.DATA_VENDA, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,

CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA,
ROUND(1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS) * 100, 2) AS PERCENTUAL_INVÁLIDA
FROM(
SELECT NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%y-%m') AS DATA_VENDA, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
FROM notas_fiscais NF
INNER JOIN
itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, date_format(NF.DATA_VENDA, '%y-%m'), TC.NOME, TC.VOLUME_DE_COMPRA
) X WHERE (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 ;


SELECT 
    X.CPF,
    X.NOME,
    X.MES_ANO,
    X.QUANTIDADE_VENDAS,
    X.QUANTIDADE_LIMITE,
    CASE
        WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
        ELSE 'VÁLIDA'
    END AS STATUS_VENDA,
    ROUND((1 - (X.QUANTIDADE_LIMITE / X.QUANTIDADE_VENDAS)) * 100, 2) AS PERCENTUAL
FROM
-- usar um select como destino de outro SELECT
    (SELECT 
        NF.CPF,
            TC.NOME,
            DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
            SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
            MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
    FROM
        notas_fiscais NF
    INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
    INNER JOIN tabela_de_clientes TC ON TC.CPF = NF.CPF
    GROUP BY NF.CPF , TC.NOME , DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X -- FIM FROM

WHERE
    (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;

-- Vendas por sabor

/*
Na primeira coluna, são apresentados os sabores dos sucos.
Na segunda, o ano analisado (2016). 
Na terceira coluna, temos a quantidade vendida no ano todo, em litros.
 Os dados devem ser ordenados do maior para o menor em relação a esta coluna. 
 E, por fim, temos o percentual de participação.
*/

-- TOTAL POR SABOR
SELECT 
	X.SABOR AS 'Sabor',
	X.ANO AS 'Ano',
    X.QUANTIDADE_VENDAS AS 'Quantidade Vendida'
FROM
    (SELECT
        SABOR,
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
        
    FROM
        notas_fiscais NF
	INNER JOIN itens_notas_fiscais INF 
		ON NF.NUMERO = INF.NUMERO
    INNER JOIN  tabela_de_produtos TP 
        ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    
	GROUP BY SABOR , YEAR(NF.DATA_VENDA)) X -- FIM FROM
WHERE
   X.ANO = 2016
ORDER BY X.QUANTIDADE_VENDAS DESC;

-- TOTAL 2016
SELECT 
    
    X.ANO AS 'Ano',
    X.QUANTIDADE_VENDAS AS 'Total de vendas'
FROM
    (SELECT
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
        
    FROM
        notas_fiscais NF
	INNER JOIN itens_notas_fiscais INF 
		ON NF.NUMERO = INF.NUMERO
    INNER JOIN  tabela_de_produtos TP 
        ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    
	GROUP BY YEAR(NF.DATA_VENDA)) X -- FIM FROM
WHERE
   X.ANO = 2016
GROUP BY  X.ANO
ORDER BY X.QUANTIDADE_VENDAS DESC;


-- AGORA VAMOS UNIR AS DUAS SUB CONSULTAR ACIMA
-- AGORA VAMOS UNIR AS DUAS SUB CONSULTAR ACIMA
SELECT 
    TOTAL_SABOR.SABOR as 'Sabor',
    TOTAL_SABOR.ANO as 'Ano',
    TOTAL_SABOR.QUANTIDADE_VENDAS as 'Quantidade Vendida',
    CONCAT(ROUND(((TOTAL_SABOR.QUANTIDADE_VENDAS/TOTAL_2016.QUANTIDADE_VENDAS)*100),2), "%") as 'percentual'
FROM
    (SELECT 
        X.SABOR,
        X.ANO,
        X.QUANTIDADE_VENDAS
    FROM
        (SELECT
            SABOR,
            YEAR(NF.DATA_VENDA) AS ANO,
            SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
            
        FROM
            notas_fiscais NF
        INNER JOIN itens_notas_fiscais INF 
            ON NF.NUMERO = INF.NUMERO
        INNER JOIN  tabela_de_produtos TP 
            ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
        
        GROUP BY SABOR , YEAR(NF.DATA_VENDA)) X -- FIM FROM
    WHERE
    X.ANO = 2016
    ORDER BY X.QUANTIDADE_VENDAS DESC) AS  TOTAL_SABOR
    INNER JOIN
    (SELECT 
        
        X.ANO,
        X.QUANTIDADE_VENDAS
    FROM
        (SELECT
            YEAR(NF.DATA_VENDA) AS ANO,
            SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
            
        FROM
            notas_fiscais NF
        INNER JOIN itens_notas_fiscais INF 
            ON NF.NUMERO = INF.NUMERO
        INNER JOIN  tabela_de_produtos TP 
            ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
        
        GROUP BY YEAR(NF.DATA_VENDA)) X -- FIM FROM
    WHERE
    X.ANO = 2016
    GROUP BY  X.ANO
    ORDER BY X.QUANTIDADE_VENDAS DESC) AS TOTAL_2016
ON TOTAL_2016.ANO = TOTAL_SABOR.ANO
GROUP BY TOTAL_SABOR.SABOR, TOTAL_SABOR.ANO, TOTAL_SABOR.QUANTIDADE_VENDAS
ORDER BY TOTAL_SABOR.QUANTIDADE_VENDAS DESC;

SELECT 
    TOTAL_SABOR.SABOR as 'Sabor',
    TOTAL_SABOR.ANO as 'Ano',
    TOTAL_SABOR.QUANTIDADE_VENDAS as 'Quantidade Vendida',
    CONCAT(ROUND(((TOTAL_SABOR.QUANTIDADE_VENDAS/TOTAL_2016.QUANTIDADE_VENDAS)*100),2), "%") as 'percentual'
FROM
   (SELECT
        SABOR,
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
            
        FROM
            notas_fiscais NF
        INNER JOIN 
            itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
        INNER JOIN  
            tabela_de_produtos TP ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
		WHERE YEAR(NF.DATA_VENDA) = 2016
        GROUP BY 
            SABOR, YEAR(NF.DATA_VENDA)
		ORDER BY
			QUANTIDADE_VENDAS DESC) 

AS  TOTAL_SABOR

INNER JOIN
    
    (SELECT
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
        FROM
            notas_fiscais NF
        INNER JOIN
            itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
        INNER JOIN
            tabela_de_produtos TP ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
		 WHERE
            YEAR(NF.DATA_VENDA) = 2016
		GROUP BY
            ANO
        ORDER BY
            QUANTIDADE_VENDAS DESC)

AS TOTAL_2016

ON TOTAL_2016.ANO = TOTAL_SABOR.ANO
GROUP BY 
    TOTAL_SABOR.SABOR, TOTAL_SABOR.ANO, TOTAL_SABOR.QUANTIDADE_VENDAS
ORDER BY 
    TOTAL_SABOR.QUANTIDADE_VENDAS DESC;

-- Modifique o relatório mas agora para ver o ranking das vendas por tamanho.


SELECT 
    TOTAL_SABOR.TAMANHO as 'Tamanho',
    TOTAL_SABOR.ANO as 'Ano',
    TOTAL_SABOR.QUANTIDADE_VENDAS as 'Quantidade Vendida',
    CONCAT(ROUND(((TOTAL_SABOR.QUANTIDADE_VENDAS/TOTAL_2016.QUANTIDADE_VENDAS)*100),2), "%") as 'percentual'
FROM
   (SELECT
        TAMANHO,
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
            
        FROM
            notas_fiscais NF
        INNER JOIN 
            itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
        INNER JOIN  
            tabela_de_produtos TP ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
        GROUP BY 
            TAMANHO, YEAR(NF.DATA_VENDA)
        WHERE
            ANO = 2016
    ORDER BY QUANTIDADE_VENDAS DESC) 

AS  TOTAL_SABOR

INNER JOIN
    
    (SELECT
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
        FROM
            notas_fiscais NF
        INNER JOIN
            itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
        INNER JOIN
            tabela_de_produtos TP ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
            
        GROUP BY 
            YEAR(NF.DATA_VENDA)
        WHERE
            ANO = 2016
        GROUP BY
            ANO
        ORDER BY
            QUANTIDADE_VENDAS DESC)

AS TOTAL_2016

ON TOTAL_2016.ANO = TOTAL_SABOR.ANO
GROUP BY 
    TOTAL_SABOR.TAMANHO, TOTAL_SABOR.ANO, TOTAL_SABOR.QUANTIDADE_VENDAS
ORDER BY 
    TOTAL_SABOR.QUANTIDADE_VENDAS DESC;