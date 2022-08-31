USE sucos_vendas;

SELECT LTRIM('    OLÁ');

SELECT RTRIM('OLÁ     ');

SELECT TRIM('        OLÁ     ');

SELECT CONCAT('OLÁ ' , 'MUNDO');

SELECT UPPER('oi mundo!');

SELECT LOWER('OLÁ MUNDO');

SELECT SUBSTRING('OLÁ TUDO TRANQUILO?', 5);

SELECT SUBSTRING('OLÁ TUDO TRANQUILO?', 5, 4);

SELECT CONCAT(NOME, ' (', CPF, ')') FROM tabela_de_clientes;
-- Faça uma consulta listando o nome do cliente e 
-- o endereço completo (Com rua, bairro, cidade e estado).


SELECT CONCAT(NOME, ' ', ENDERECO_1, '  BAIRRO ', BAIRRO, ' CIDADE ', CIDADE, ' ESTADO ', ESTADO) AS NOME_ENDERECO
FROM tabela_de_clientes;

SELECT NOME, CONCAT(ENDERECO_1, ', ', BAIRRO, ', ', CIDADE, ' - ', ESTADO) AS COMPLETO
FROM tabela_de_clientes

