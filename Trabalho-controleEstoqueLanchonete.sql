/* Criação do banco de dados*/
CREATE DATABASE IF NOT EXISTS controleEstoqueLanchonete;
USE controleEstoqueLanchonete; 

/* Criação do usuário global */
CREATE USER 'admin01'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON controleEstoqueLanchonete.* TO 'admin01'@'localhost';

/* Criação do usuário setor de compras */
CREATE USER 'comprador'@'localhost' IDENTIFIED BY 'comprar01';
GRANT ALL PRIVILEGES ON controleEstoqueLanchonete.entradas_estoque TO 'comprador'@'localhost';

/* criação do usuário setor de vendas  */
CREATE USER 'vendedor'@'localhost' IDENTIFIED BY 'vender01';
GRANT ALL PRIVILEGES ON controleEstoqueLanchonete.saidas_estoque TO 'vendedor'@'localhost';


/* Criação da tabela produtos */
create table Produtos (
	id_produto int auto_increment primary key,
    nome_produto varchar(255),
    descricao text, 
    preco_unitario decimal(10, 2)
);

/* Criação da tabela entrada de produtos no estoque */
create table Entradas_estoque (
	id_entrada int auto_increment primary key, 
    id_produto int,
    quantidade int,
    data_entrada date,
    foreign key (id_produto) references Produtos(id_produto) 
);  

/* Criação da tabela saída de produtos no estoque */
create table Saidas_estoque (
	id_saidas int auto_increment primary key, 
    id_produto int,
    quantidade int,
    data_saida date,
    foreign key (id_produto) references Produtos(id_produto) 
); 

/* Inserção de produtos */ 
INSERT INTO controleestoquelanchonete.produtos(nome_produto, descricao, preco_unitario) values 
		('x-burguer','hamburguer, queijo, pao, alface, tomate','7.00'),
        ('x-bacon','hamburguer, bacon, queijo, pao, alface, tomate','9.00'),
        ('x-frango','frango, queijo, pao, alface, tomate','9.00'),
        ('x-ovo','ovo, queijo, pao, alface, tomate','9.00'),
        ('x-calabresa','calabresa, queijo, pao, alface, tomate','9.00'),
        ('x-asrdinha','sardinha, queijo, pao, alface, tomate','9.00'),
        ('coca-cola','refrigerante de cola','5.00'),
        ('coca-cola zero','refrigerante de cola zero açucar','5.00'),
        ('sprite','refrigerante de limao','5.00'),
        ('fanta laranja','refrigerante de laranja','5.00'),
        ('fanta uva','refrigerante de uva','5.00'),
        ('fritas','porção de batata fritas(300g)','6.00'),
        ('coração com fritas','porção de fritas(150g) com coração frito(150g)','8.00'),
        ('polenta frita', 'porção de polenta frita(300g)', '7.00'),
		('suco de laranja','suco de laranja(500ml)','7.00'),
		('suco de morango','suco de morango(500ml)','7.00'),
		('suco de abacaxi','suco de abacaxi(500ml)','7.00'),
		('sorvete napolitano','taça sorvete napolitano (500ml)','8.00'),
		('sorvete creme','taça sorvete creme (500ml)','8.00');
        
/* Inserção de produtos no estoque no dia 15/11/2023 */ 
INSERT INTO controleestoquelanchonete.entradas_estoque(id_produto, quantidade, data_entrada) values
		('1', '30', '2023-11-15'),
        ('2', '30', '2023-11-15'),
        ('3', '30', '2023-11-15'),
        ('4', '30', '2023-11-15'),
        ('5', '30', '2023-11-15'),
        ('6', '30', '2023-11-15'),
        ('7', '30', '2023-11-15'),
        ('8', '30', '2023-11-15'),
        ('9', '30', '2023-11-15'),
        ('10', '30', '2023-11-15'),
        ('11', '30', '2023-11-15'),
        ('12', '30', '2023-11-15'),
        ('13', '30', '2023-11-15'),
        ('14', '30', '2023-11-15'),
        ('15', '30', '2023-11-15'),
        ('16', '30', '2023-11-15'),
        ('17', '30', '2023-11-15'),
        ('18', '30', '2023-11-15'),
        ('19', '30', '2023-11-15');

/* Baixas de produtos dia 16/11/2023 */
INSERT INTO controleestoquelanchonete.saidas_estoque(id_produto, quantidade, data_saida) values 
        ('1', 30, '2023-11-16'), 
        ('2', 5, '2023-11-16'), 
        ('3', 6, '2023-11-16'), 
		('4', 20, '2023-11-16'),
        ('5', 20, '2023-11-16'),
        ('6', 20, '2023-11-16'),
        ('7', 25, '2023-11-16'),
        ('8', 30, '2023-11-16'),
        ('9', 40, '2023-11-16'),
		('10', 40, '2023-11-16'),
        ('11', 50, '2023-11-16'),
        ('12', 50, '2023-11-16'),
        ('13', 60, '2023-11-16'),
        ('14', 40, '2023-11-16'),
        ('15', 20, '2023-11-16'),
        ('16', 40, '2023-11-16'),
        ('17', 40, '2023-11-16'),
        ('18', 40, '2023-11-16'),
        ('19', 40, '2023-11-16');
        
/* Quantidade de produtos que entraram no estoque */
SELECT id_produto, SUM(quantidade) as soma_entradas
FROM controleestoquelanchonete.entradas_estoque
GROUP BY id_entrada; 

/* Quantidade de produtos que saíram do estoque */
SELECT id_produto, SUM(quantidade) as soma_saidas
FROM controleestoquelanchonete.saidas_estoque
GROUP BY id_saidas; 

/* Quantidade de produtos que entraram no estoque identificados pelo nome*/
SELECT P.id_produto, P.nome_produto, SUM(E.quantidade) as soma_entrada
FROM controleestoquelanchonete.Produtos P
JOIN controleestoquelanchonete.Entradas_estoque E ON 
P.id_produto = E.id_produto
GROUP BY P.id_produto, P.nome_produto;

/* Quantidade de produtos que saíram do estoque identificados pelo nome*/
SELECT P.id_produto, P.nome_produto, SUM(S.quantidade) as soma_saida
FROM controleestoquelanchonete.Produtos P
JOIN controleestoquelanchonete.Saidas_estoque S ON 
P.id_produto = S.id_produto
GROUP BY P.id_produto, P.nome_produto;

/* relatório com saldo total de estoque ao final do dia 15/11/2023 */
SELECT
	tbproduto.id_produto,
    tbproduto.nome_produto,
    tbentradas.total_entradas,
    tbsaidas.total_saidas,
    (tbentradas.total_entradas) - (tbsaidas.total_saidas) as saldo_atual
    /* ate depois do from são as informações da tabela da esquerda */
    FROM controleestoquelanchonete.produtos tbproduto
    INNER JOIN (SELECT id_produto, SUM(quantidade) as total_entradas
		FROM controleestoquelanchonete.entradas_estoque
		GROUP BY id_produto) tbentradas
        ON tbproduto.id_produto = tbentradas.id_produto
	INNER JOIN (SELECT id_produto, SUM(quantidade) as total_saidas
		FROM controleestoquelanchonete.saidas_estoque
		GROUP BY id_produto) tbsaidas
        ON tbproduto.id_produto = tbsaidas.id_produto; 

/* Entradas de mais produtos para equilibrar estoques */      
UPDATE controleestoquelanchonete.entradas_estoque
    SET quantidade = 60
    WHERE id_entrada IN (1, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19);
    
/* Atualização dos estoques após entrada de mais quantidades de produtos */      
SELECT
	tbproduto.id_produto,
    tbproduto.nome_produto,
    tbentradas.total_entradas,
    tbsaidas.total_saidas,
    (tbentradas.total_entradas) - (tbsaidas.total_saidas) as saldo_atual
    /* ate depois do from são as informações da tabela da esquerda */
    FROM controleestoquelanchonete.produtos tbproduto
    INNER JOIN (SELECT id_produto, SUM(quantidade) as total_entradas
		FROM controleestoquelanchonete.entradas_estoque
		GROUP BY id_produto) tbentradas
        ON tbproduto.id_produto = tbentradas.id_produto
	INNER JOIN (SELECT id_produto, SUM(quantidade) as total_saidas
		FROM controleestoquelanchonete.saidas_estoque
		GROUP BY id_produto) tbsaidas
        ON tbproduto.id_produto = tbsaidas.id_produto;


        

   