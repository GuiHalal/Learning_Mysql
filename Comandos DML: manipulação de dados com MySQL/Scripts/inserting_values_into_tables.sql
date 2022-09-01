USE vendas_sucos;

INSERT INTO PRODUTOS(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALHAGEM, PRECO_LISTA)
VALUES ('1040107', 'Light 350 ml', 'Melancia', '350 ml', 'lata', 4.56);

UPDATE PRODUTOS
SET 
DESCRITOR = 'Light 350 ml - Melancia'
WHERE CODIGO = '1040107';

UPDATE PRODUTOS
SET 
TAMANHO = '350 ml', EMBALHAGEM = 'Lata'
WHERE CODIGO = '1040107';

SELECT * FROM PRODUTOS;

INSERT INTO PRODUTOS(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALHAGEM, PRECO_LISTA)
VALUES ('1040108', 'Light 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00);

SELECT * FROM PRODUTOS;

/*
It is not mandatory that the fields names are displayed, but the order of the values 
must be the same as the order of columns on the table*/
INSERT INTO PRODUTOS
VALUES ('1040109', 'Light 350 ml - Açai', 'Açai', '350 ml', 'Lata', 5.60);

SELECT * FROM PRODUTOS;

-- template to multiple insertions 
INSERT INTO PRODUTOS
VALUES
	('1040110', 'Light 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 6.00),
	('1040111', 'Light 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50);

SELECT * FROM PRODUTOS;

-- exercises:
INSERT INTO CLIENTES (CPF, NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP,  DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO,
                        VOLUME_COMPRA,  PRIMEIRA_COMPRA)
VALUES
    ('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo', 'SP', '80012212', '1990-09-01', 27, 'F', 170000,  24500, 0),
    ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa', 'Rio de Janeiro', 'RJ', '22000000', '2000-02-12', 18, 'M', 100000, 20000, 1),
    ('2600586709', 'César Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', '22020001', '2000-03-12', 18, 'M', '120000', '22000', 0);
    
SELECT * FROM CLIENTES;
