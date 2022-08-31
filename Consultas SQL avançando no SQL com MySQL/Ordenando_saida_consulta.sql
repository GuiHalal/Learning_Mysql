-- Ordenando a saída da consulta

SELECT * FROM tabela_de_produtos;

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA desc;

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA asc;

SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

SELECT 
    *
FROM
    tabela_de_produtos
ORDER BY EMBALAGEM , TAMANHO DESC;

-- Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto “Linha Refrescante - 1 Litro
-- - Morango/Limão”, em quantidade? (Obtenha este resultado usando 2 SQLs).

SELECT CODIGO_DO_PRODUTO FROM tabela_de_produtos WHERE 
	NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limão';

SELECT * FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = 1101035 order by QUANTIDADE desc;

