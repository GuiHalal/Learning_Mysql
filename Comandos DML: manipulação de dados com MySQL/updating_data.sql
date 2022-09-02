-- updating data in tables 

USE vendas_sucos;

select * FROM PRODUTOS;

UPDATE PRODUTOS SET PRECO_LISTA = 5 WHERE CODIGO = 1000889;

UPDATE PRODUTOS SET EMBALHAGEM = 'PET', TAMANHO = '1 Litro', 
DESCRITOR = 'Sabor da Montanha - 1 Litro - Uva'  WHERE CODIGO = 1000889;

SELECT * FROM PRODUTOS WHERE SABOR = 'MARACUJA';

UPDATE PRODUTOS SET PRECO_LISTA = PRECO_LISTA*1.10 WHERE SABOR = 'MARACUJA';

/*
Atualize o endereço do cliente com cpf 19290992743 
para R. Jorge Emílio 23 o bairro para Santo Amaro, 
a cidade para São Paulo, o estado para SP e o CEP para 8833223. */

UPDATE CLIENTES SET 
ENDERECO = 'R. Jorge Emílio 23', 
BAIRRO = 'Santo Amaro',
CIDADE = 'São Paulo', 
ESTADO = 'SP', 
CEP = '8833223'
WHERE CPF = '19290992743';

SELECT * FROM VENDEDORES;

SELECT * FROM sucos_vendas.tabela_de_vendedores;

SELECT * FROM VENDEDORES A 
INNER JOIN sucos_vendas.tabela_de_vendedores B 
ON A.MATRICULA = substring(B.MATRICULA, 3,3);

UPDATE VENDEDORES A INNER JOIN sucos_vendas.tabela_de_vendedores B 
ON A.MATRICULA = substring(B.MATRICULA, 3,3)
SET A.FERIAS = B.DE_FERIAS;

/*
Podemos observar que os vendedores possuem bairro associados a eles. 
Vamos aumentar em 30% o volume de compra dos clientes que possuem, 
em seus endereços bairros onde os vendedores possuam escritórios.*/

SELECT * FROM VENDEDORES A INNER JOIN CLIENTES B 
ON A.BAIRRO = B.BAIRRO;

UPDATE VENDEDORES A INNER JOIN CLIENTES B
ON A.BAIRRO = B.BAIRRO 
SET B.VOLUME_COMPRA = B.VOLUME_COMPRA *1.30;

-- DELETE

DELETE FROM PRODUTOS WHERE CODIGO = '1001000';

SELECT * FROM PRODUTOS WHERE substring(DESCRITOR, 1, 15) = 'SABOR DOS ALPES';

DELETE FROM PRODUTOS WHERE TAMANHO = '1 Litro' AND substring(DESCRITOR, 1, 15) = 'SABOR DOS ALPES';

SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos;

SELECT CODIGO FROM PRODUTOS 
WHERE CODIGO NOT IN 
	(SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos);
    
DELETE FROM PRODUTOS WHERE 
CODIGO NOT IN 
	(SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos);
    
/*
Desafio: Vamos excluir as notas fiscais (Apenas o cabeçalho) 
cujos clientes tenham a idade menor ou igual a 18 anos.*/

SELECT * FROM CLIENTES WHERE IDADE <= 18;

SELECT * FROM NOTAS A INNER JOIN CLIENTES B
ON A.CPF = B.CPF;

SELECT * FROM NOTAS A INNER JOIN CLIENTES B
ON A.CPF = B.CPF
WHERE IDADE <= 18;

DELETE A  FROM NOTAS A INNER JOIN CLIENTES B
ON A.CPF = B.CPF
WHERE IDADE <= 18;

--

DELETE FROM ITENS_NOTAS;
DELETE FROM NOTAS;