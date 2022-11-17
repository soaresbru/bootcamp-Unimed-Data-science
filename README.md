# Geração Tech Unimed-BH - Ciência de Dados
Este é um bootcamp oferecido na DIO

## Resumo do bootcamp:
O bootcamp Unimed-BH Ciência de Dados é para profissionais que já atuam com ciência de dados ou estão começando na carreira. 
Durante o programa tive experiências educacionais com Python, banco de dados relacional e não relacional, 
além de uma imersão Cloud Computer e Machine Learning. 


#### Este Readme é um resumo do conteúdo dos arquivos, seguindo a seguinte ordem:
1. Python e Machine Learning:
    - Telco_Churn_EDA+ML_Classifier.ipynb:
    - EDA_e_previsão_de_Covid_no_Brasil.ipynb:
    - modulo-pacote-python:
    - cachorro_ou_gato.ipynb:

2. Banco de dados, SQL e AWS: 
    - Projeto Conceitual - Banco de Dados - E- Commerce:
    - Projeto Conceitual - Oficina Mecânica - Banco de Dados.png:
    - esquema E-commerce.sql:
    - esquema oficina.sql:
    - DynamoDB:
    - AWS-athena:


## Python e Machine Learning:

### Telco_Churn_EDA+ML_Classifier.ipynb:
Fazendo uma Análise Exploratória de dados pensando nos seguintes aspectos:
1. Visualizar a distribuição das características dos clientes através do conjunto
de dados.
    - Mapear o perfil dos clientes;
    - Descobrir quais os principais serviços e métodos de pagamento utilizados;
2. Buscar correlações entre as variáveis;
3. Entender o comportamento dos clientes pelo uso dos serviços;
    - Quantidade de meses que utilizou;
    - Valor pago durante o tempo de uso;
Por fim fazendo o modelo de classificação para tentar prever os clientes que darão churn, obtendo uma acurácia de aproximadamente 80%  


### EDA_e_previsão_de_Covid_no_Brasil.ipynb:
Neste notebook serão realizadas as principais etapas para realizar as análises dos dados disponíveis e fazer uma breve previsão dos casos e mortes de COVID para o próximo mês no Brasil comparando o método ARIMA com o Prophet. Para isso o notebook possui o seguinte conteúdo:
1. Leitura das bases consumidas
2. Análise dos dados
3. Prevendo o número de casos no próximo mês com ARIMA
4. Prevendo o número de casos no próximo mês com Prophet
5. Prevendo o número de mortes no próximo mês com ARIMA
6. Prevendo o número de mortes no próximo mês com Prophet  


### modulo-pacote-python:
Criando um módulo e pacote do zero, que:
1. Lê o preço, e:  
    - Aceita apenas valores monetários
    - É possível inserir valores quebrados com vírgula ou ponto, exemplo 1,50 ou 1.50
2. Com o preço, calcula e mostra um resumo com:  
    - O dobro do preço
    - A metade do preço
    - Um aumento no preço de 20% por exemplo (valor a critério do usuário)
    - Um desconto no preço de 12% por exemplo (valor a critério do usuário) Tudo isso deixando com duas casas decimais  
    

### cachorro_ou_gato.ipynb:
Aplicando redes neurais para fazer o reconhecimento de imagens e saber se uma imagem é de cachorro ou gato, o ideia é utilizar uma quantidade pequena de dados que ver quando as redes neurais estão começando a aprender e não é apenas um chute. Para isso o notebook possui o seguinte conteúdo:
1. Importando as bibliotecas
2. Leitura das bases consumidas
3. Manipulando os dados de treino
4. Construindo o modelo
5. Criando Callback
6. Dividindo em treino e validação
7. Data Augmentation
8. Treinando o modelo
9. Avaliando mais o modelo
10. Aplicando aos dados de treino
11. Conclusão  


## Banco de dados, SQL e AWS: 

### Projeto Conceitual - Banco de Dados - E- Commerce:
Elaborando o projeto conceitual de um E-commerce e refinando o modelo apresentado acrescentando os seguintes pontos:  
    - Cliente PJ e PF: Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;  
    - Pagamento: Pode ter cadastrado mais de uma forma de pagamento;  
    - Entrega: Possui status, código de rastreio e prazo;  
    - O cliente pode ter mais de um endereço;  
    - O cliente pode ter mais de um cartão;  
    - O forncedor, vendedor terceiro e o local do estoque possuem email e telefone cadastrados para contato.  

### Projeto Conceitual - Oficina Mecânica - Banco de Dados.png:
Realizando o projeto de um esquema conceitual de uma oficina mecânica do zero com base nos seguintes tópicos:  
    - Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica  
    - Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas  
    - Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.  
    - A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra  
    - O valor de cada peça também irá compor a OS do cliente  
    - A mesma equipe avalia e executa os serviços  
    - Os mecânicos possuem código, nome, endereço, telefone para contato, telefone para emergência,  especialidade 1 e especialidade 2.  
    - Cada OS possui: n°, data de emissão, um valor, status, tipo de serviço e uma data para conclusão dos trabalhos.  
    - Uma equipe pode ter diferentes mecânicos e um mesmo mecânico pode estar em mais de uma equipe, a equipe pode trabalhar com mais de um veículo.  
    - Um cliente pode ter mais de um veículo, e o cliente possui informações de nome, data de nascimento, CPF, endereço, telefone e email.  
    - O carro possui dados como, nome do veiculo, marca, ano , placa e cor.  

### esquema E-commerce.sql:  
Projeto lógico de banco de dados de um E-commerce, com:  
- criação do banco de dados ( incluindoa as definições de chave primária e estrangeira, assim como as constraints presentes no cenário modelado)  
- Inserção de dados  
- Realização de consultas SQL, criando queries SQL com as cláusulas abaixo:  
    - Recuperações simples com SELECT Statement  
    - Filtros com WHERE Statement  
    - Crie expressões para gerar atributos derivados  
    - Defina ordenações dos dados com ORDER BY  
    - Condições de filtros aos grupos – HAVING Statement  
    - Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados  
- Perguntas respondidas com as Queries:  
    - Qual a quantidade de clientes ?  
    - Qual o status dos pedidos de todos os pedidos?  
    - Quais são os pedidos de cada cliente?  
    - Quanto pedidos foram realizados pelos clientes?  
    - Quais os clientes que mais gastam e menos ?  
    - Como está o status de uma entrega para um cliente em SP?  
    - Quais os produtos estão com o estoque do fornecedor baixo? (menor do que 10)  
    
    
### esquema oficina.sql:
Projeto lógico de banco de dados de uma oficina mecânica começando do zero, com:  
- criação do banco de dados ( incluindoa as definições de chave primária e estrangeira, assim como as constraints presentes no cenário modelado)  
- Inserção de dados  
- Realização de consultas SQL, criando queries SQL com as cláusulas abaixo:  
    - Recuperações simples com SELECT Statement  
    - Filtros com WHERE Statement  
    - Crie expressões para gerar atributos derivados  
    - Defina ordenações dos dados com ORDER BY  
    - Condições de filtros aos grupos – HAVING Statement  
    - Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados  
- Perguntas respondidas com as Queries:   
    - Qual a quantidade de clientes ?  
    - Quem é o dono do veiculo de placa 'lpd5678'?   
    - Vai chegar um carro para revisão, Qual funcionário é mais indicado para consertar?  
    - Quais os valores dos conserto dos carros?  
    - Quais veiculos com mais de 48h de trabalho?  

### DynamoDB:
Criando um repositório de música, baseado na aula Boas práticas com DynamoDB, adicionando músicas da Marília Mendonça e do Zé Neto e Cristiano.
Utilizando Amazon DynamoDB e Amazon CLI para execução em linha de comando.  
Também adicionando o arquivo itemmusic2.json e fazendo mais buscas por Queries.

### AWS-athena:
Explorando Dados Demográficos com Serviços de Big Data na AWS, utilizando Amazon S3, Amazon Glue, principalmente **Amazon Athena**, e Amazon QuickSight.
Criando queries para saber:
- A soma da população total
- Ver a população de uma cidade
- As cidade do RJ ordenando pela população em ordem crescente
- As 5 cidades do Brasil com maior população
- As 5 cidades do Brasil com menor população
- Os estados que possuem a média de população maior que 100 mil
