# ENTRA21-Banco-de-Dados-SQL
Trabalho do Programa ENTRA21 de Banco de Dados Relacional usando Workbench MySQL - Lanchonete 

1) Criação banco de dados “controleEstoqueLanchonete” 

a)	Criação do Database. 

![1](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/6f0217f8-51b8-4d25-a942-07841a89d85f)

b)	Criação do usuário Global “admin01” e concessão de permissão para manipulação do database.

b.1) Criação do usuário “comprador” e concessão de permissão para manipular a tabela "entradas_estoque" 

b.2) Criação do usuário “vendedor” e concessão de permissão para manipular a tabela "saidas_estoque" 


![2](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/c1e836dd-12d3-4de0-a7e7-e27e826d0ec1)

c)	Criação das Tabelas 

c.1)  Tabela Produtos

c.2)  Tabela Entradas_Estoque

c.3)  Tabela Saidas_Estoque

![3](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/963e2e9f-44ca-4135-ba36-58a3ebabe382)

2) Inserção de dados

a) Povoamento(seed) na tabela Produtos. 

![4](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/6f9af10f-486c-442a-801c-e01cbf628871)

b) Povoamento(seed) na tabela Entradas_estoque. 

![5](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/b62cf5ce-b6ac-4440-8e8f-6c4d08da8d6e)

c) Povoamento(seed) na tabela Saidas_estoque. 

![6](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/c1194cd5-9ae7-4900-8138-702213eb8eb6)

3) Comandos CRUD

a)	Select na tabela Produtos.

![7](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/97587e78-02c9-4cd2-a1f6-ab2d11f94175)

b)	Select na tabela Entradas_estoque.

![8](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/f45691d8-923d-4bac-9960-5a19f274e25a)

c)	Select na tabela Saidas_estoque.

![9](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/a6d5ea23-102f-4530-bb31-4776ac5c9235)

d)	Soma dos produtos que deram entrada no estoque.

![10](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/6c919f8d-baf3-4453-9d67-01902e81a4eb)

e)	Soma dos produtos que deram baixa (saída) do estoque.

![11](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/832446f1-13d8-4389-a888-faad9526f5b3)

f)	Soma dos produtos da entrada do estoque com o nome para facilitar identificação.

![12](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/ce0ec8ad-a67b-4fa3-8977-e3f740396ef7)

g)	Soma dos produtos da saída do estoque com o nome para facilitar identificação.

![13](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/2abc0480-b42c-40ad-b07d-8516c8c1af91)

h)	Relatório com o total dos produtos de entrada, total dos produtos de saída e o saldo em estoque.

![14](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/7e237c8f-ab78-4763-8a64-544b3d187d17)

i)	Atualização (UPDATE) de estoque de entrada com inserção dos produtos que ficaram com saldo negativo após o feriado de 15/11 em que houve muitas vendas e alguns produtos que tiveram que ser comprados no dia. Assim, com o UPDATE, o saldo final irá cobrir os estoques negativos.

![15](https://github.com/Ricardo3113/ENTRA21-Banco-de-Dados-SQL/assets/72181931/5212aba8-87d9-4ec9-a0ab-5bc6e3bb374e)


