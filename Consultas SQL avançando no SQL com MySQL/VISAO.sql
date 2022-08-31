use sucos_vendas;

select embalagem, max(preco_de_lista) as maior_preco from tabela_de_produtos
group by embalagem;

select x.embalagem, x.maior_preco from VW_MAIORES_EMBALAGENS x 
where x.maior_preco >=10;

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, B.MAIOR_PRECO
FROM tabela_de_produtos A INNER JOIN VW_MAIORES_EMBALAGENS B
ON A.EMBALAGEM = B.EMBALAGEM;

-- JÁ PERMITE VER UM EXEMPLO DE GERAÇÃO DE RELATÓRIO 
SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, B.MAIOR_PRECO,
((A.PRECO_DE_LISTA / B.MAIOR_PRECO) -1) *100 AS PERCENTUAL
FROM tabela_de_produtos A INNER JOIN VW_MAIORES_EMBALAGENS B
ON A.EMBALAGEM = B.EMBALAGEM;