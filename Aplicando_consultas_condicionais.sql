SELECT * FROM tabela_de_produtos where SABOR = 'MANGA' OR TAMANHO = '470 ML';

SELECT * FROM tabela_de_produtos where SABOR = 'MANGA' AND TAMANHO = '470 ML';

SELECT * FROM tabela_de_produtos where NOT(SABOR = 'MANGA' AND TAMANHO = '470 ML');

SELECT * FROM tabela_de_produtos where NOT(SABOR = 'MANGA' AND NOT(TAMANHO = '470 ML'));

SELECT * FROM tabela_de_produtos where SABOR IN ('MANGA', 'LARANJA');

SELECT * FROM tabela_de_clientes where CIDADE IN ('RIO DE JANEIRO', 'SAO PAULO') AND 
IDADE >=20 ORDER BY IDADE;

SELECT * FROM tabela_de_clientes where CIDADE IN ('RIO DE JANEIRO', 'SAO PAULO') AND 
(IDADE >=20 AND IDADE <=22) ORDER BY IDADE;
