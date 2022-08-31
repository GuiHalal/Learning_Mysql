USE sucos_vendas;

SELECT CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE,
 ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO, 
 VOLUME_DE_COMPRA, PRIMEIRA_COMPRA FROM tabela_de_clientes;
 
 SELECT * FROM tabela_de_clientes;
 
 SELECT CPF, NOME FROM tabela_de_clientes;
 
 SELECT CPF AS Identificador, NOME AS 'Nome Cliente' FROM tabela_de_clientes;
 
 SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';
 
 SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga';
 
 -- case insensitive
 SELECT * FROM tabela_de_produtos WHERE SABOR = 'manga';
 
 