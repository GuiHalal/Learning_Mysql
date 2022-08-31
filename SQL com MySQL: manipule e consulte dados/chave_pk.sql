USE sucos;

ALTER TABLE tbProduto ADD PRIMARY KEY (PRODUTO);

INSERT INTO tbProduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES
('544931', 'Frescor do Verão - 350 ml - Limão', 'Garrafa', '350 ml','Limão',3.20);

SELECT * FROM tbProduto;