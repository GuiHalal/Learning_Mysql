-- Funções de datas
USE sucos_vendas;

-- ADD POR INTERVALO
SELECT ADDDATE();

-- TIMESTAMPE
SELECT ADDTIME();

-- HORÁRIO
SELECT CURRENT_TIME();

-- 
SELECT MONTH(current_timestamp());

-- DATA
SELECT CURDATE();

SELECT DATEDIFF('2022-08-24', '2020-03-15')/365;

SELECT DATEDIFF(current_timestamp(), '2020-03-15');

SELECT DATEDIFF(current_timestamp(), '1985-08-16') AS DIAS_DE_VIDA;

SELECT DATE_ADD('2017-06-15', INTERVAL 25 DAY);

SELECT day('2015-05-12');

SELECT current_timestamp() AS DIA_DE_HOJE, 
	DATE_ADD(current_timestamp(), INTERVAL 10000 DAY) AS DAQUI_A_10K_DIAS;
    
SELECT DISTINCT DATA_VENDA, dayname(DATA_VENDA) AS DIA, monthname(DATA_VENDA) AS MES, year(DATA_VENDA) AS ANO
 FROM notas_fiscais;

-- Crie uma consulta que mostre o nome e a idade atual dos clientes.
SELECT NOME, 
IF(month(DATA_DE_NASCIMENTO)<month(current_timestamp()), (year(current_timestamp())-YEAR(DATA_DE_NASCIMENTO)),
	IF(month(current_date()=month((DATA_DE_NASCIMENTO))), IF(day(current_date()) > day(DATA_DE_NASCIMENTO),
    (year(current_timestamp())-YEAR(DATA_DE_NASCIMENTO)),(year(current_timestamp())-YEAR(DATA_DE_NASCIMENTO))-1),
    (year(current_timestamp())-YEAR(DATA_DE_NASCIMENTO)))-1) 
    AS IDADE_MEU, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE, DATA_DE_NASCIMENTO AS DN
    FROM tabela_de_clientes;

-- TANTA TRABALHERIA ALÍ EM CIMA E TINHA UMA FUNÇÃO QUE DAVA ISSO PRONTO PQP!
SELECT NOME, TIMESTAMPDIFF(YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE
FROM  tabela_de_clientes
