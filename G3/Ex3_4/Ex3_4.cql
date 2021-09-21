CREATE KEYSPACE store WITH REPLICATION = {'class' : 'SimpleStrategy','replication_factor' : 1};

CREATE TABLE store.customer ( email text, name text, address text,PRIMARY KEY (email));

CREATE TABLE store.product ( id int, name text, price float, description text, ratings set<int>, type list<text>,PRIMARY KEY (id, price));

CREATE TABLE store.purchase ( pur_id int, customer text,pay_method text, products map<int,int>,PRIMARY KEY (pur_id));

CREATE TABLE store.orderr ( order_id int, provider text,prod map<int,int> ,PRIMARY KEY (order_id));

CREATE TABLE store.provider ( email text, name text, address text, PRIMARY KEY (email));


INSERT INTO store.customer (email, name, address) VALUES ('manuel10@hotmail.com', 'Manuel Gomes','Rua Dona Augusta');
INSERT INTO store.customer (email, name, address) VALUES ('rf@hotmail.com', 'Rute Figueiredo','Rua de Cima');
INSERT INTO store.customer (email, name, address) VALUES ('andrcas@gmail.com', 'Andreia Castelo','Rua de Baixo');
INSERT INTO store.customer (email, name, address) VALUES ('gustasilvaa@hotmail.com', 'Gustavo Silva','Rua do Vale');
INSERT INTO store.customer (email, name, address) VALUES ('manuelsa@hotmail.com', 'Manuel Santos','Rua Menino de ouro');
INSERT INTO store.customer (email, name, address) VALUES ('scar@hotmail.com', 'Silvia Carvalho','Avenida Central');
INSERT INTO store.customer (email, name, address) VALUES ('anacas@gmail.com', 'Ana Castelo','Rua de Baixo');
INSERT INTO store.customer (email, name, address) VALUES ('pefontes@hotmail.com', 'Pedro Fontes','Avenida do Vale');


INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (214555, 'Detergente', 12.90, 'Produto incrivel para a sua cozinha!', {7,6,6,6,7}, ['a','d','t','g']); 
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (198777, 'Desengordurante', 10.99, 'Diga nao as gorduras!', {9,8,7,7}, ['b','a','t']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (745445, 'Limpador multiuso', 5.59, 'Limpe tudo o que for preciso!', {9,6,7}, ['v','q']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (254772, 'Desinfetante', 4.49, 'Desinfete qualquer coisa!', {10,9}, ['b','d','p']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (235622, 'Luvas de borracha', 6.39, 'Proteja-se!', {8,9,9}, ['v','d']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (345336, 'Baldes', 3.99, 'Produto incrivel!', {5,6}, ['a','d']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (352787, 'Panos de chão', 11.99, 'Chao impecavel!', {7,6}, ['a','d']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (117452, 'Esponja', 2.59, 'Limpe!', {9,6,10}, ['b','p','t']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (246225, 'Álcool', 6.89, 'Alcool!', {5,6,6}, ['b','p']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (133346, 'Água sanitária', 7.89, 'Agua sanitaria incrivel!', {8,7,8,9}, ['b','e']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (777343, 'Limpa-vidros', 1.59, 'Vidros incriveis!', {9,8,9,9}, ['v']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (254633, 'Lustra-móveis', 1.29, 'Produto incrivel!', {6,9,7}, ['e','s']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (965490, 'Esfregona', 17.79, 'Esfregue tudo!', {7,6}, ['a','s']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (640444, 'Gel', 9.59, 'Cuide de si!', {8,8,8,7}, ['e','d']);
INSERT INTO store.product (id, name , price, description, ratings, type) VALUES (754388, 'Vassoura', 14.69, 'Produto incrivel para a sua cozinha!', {7,8,9,9,6}, ['c']);

INSERT INTO store.provider (email, name, address) VALUES ('aliceegon@hotmail.com', 'Alice Gonçalves','Avenida Dona Almerinda');
INSERT INTO store.provider (email, name, address) VALUES ('wiljohn@hotmail.com', 'Wilson Johnson', 'Avenida Alto da Esperanca');
INSERT INTO store.provider (email, name, address) VALUES ('joao.carvalho19@hotmail.com', 'João Carvalho', 'Avenida Dona Almerinda');
INSERT INTO store.provider (email, name, address) VALUES ('ruip@hotmail.com', 'Rui Pinheiro', 'Rua do Espantalho');
INSERT INTO store.provider (email, name, address) VALUES ('keevin@hotmail.com', 'Kevin Gonçalves','Avenida do Zé');
INSERT INTO store.provider (email, name, address) VALUES ('papad@hotmail.com', 'Paulo Daniel', 'Avenida Alto da Esperanca');
INSERT INTO store.provider (email, name, address) VALUES ('otavioj@hotmail.com', 'Otavio Jorge', 'Avenida Dona Almerinda');
INSERT INTO store.provider (email, name, address) VALUES ('fonsi@hotmail.com', 'Rui Fonseca', 'Rua do Pinheiro');


INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (16378,'manuel10@hotmail.com', 'Credit Card', {345336: 2});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (78390, 'andrcas@gmail.com', 'Credit Card', {254633: 3, 754388: 1, 640444: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (23443, 'scar@hotmail.com', 'Money', {352787: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (12638, 'pefontes@hotmail.com', 'Credit Card', {117452: 2, 133346: 2, 777343: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (89208, 'gustasilvaa@hotmail.com', 'Money', {965490: 2, 777343: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (66579, 'scar@hotmail.com', 'Money', {117452: 1, 965490: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (23553,'anacas@gmail.com', 'Credit Card', {777343: 2});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (21354, 'andrcas@gmail.com', 'Credit Card', {254633: 3, 254633: 1, 352787: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (66542, 'scar@hotmail.com', 'Money', {352787: 2});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (24622, 'pefontes@hotmail.com', 'Credit Card', {117452: 2, 133346: 2, 352787: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (89578, 'anacas@gmail.com', 'Money', {965490: 2, 254633: 1});
INSERT INTO store.purchase (pur_id, customer,pay_method, products) VALUES (57899, 'manuel10@hotmail.com', 'Money', {777343: 4, 965490: 1});


INSERT INTO store.orderr (order_id,provider,prod) VALUES (7393, 'wiljohn@hotmail.com', {117452: 1,965490: 1});
INSERT INTO store.orderr (order_id,provider,prod) VALUES (5156, 'joao.carvalho19@hotmail.com', {235622: 1});
INSERT INTO store.orderr (order_id,provider,prod) VALUES (2278, 'aliceegon@hotmail.com', {640444: 2,345336:2});
INSERT INTO store.orderr (order_id,provider,prod) VALUES (3222, 'ruip@hotmail.com', {640444: 3, 133346: 3});
INSERT INTO store.orderr (order_id,provider,prod) VALUES (6734, 'joao.carvalho19@hotmail.com', {754388: 3});


UPDATE store.product
SET price = 6.39
WHERE id = 133346 IF EXISTS;

UPDATE store.product
SET name = 'Gel de banho'
WHERE id = 640444 IF EXISTS;

UPDATE store.product
SET description = 'Isto é otimo!'
WHERE id = 246225 IF EXISTS;

UPDATE store.purchase
SET pay_method = 'Money'
WHERE pur_id = 21354 IF EXISTS;

UPDATE store.orderr
SET prod = {117452: 2,965490: 1}
WHERE order_id = 7393 IF EXISTS;

DELETE FROM store.product
WHERE id = 214555;

DELETE price FROM store.product
WHERE id = 745445
IF EXISTS;

DELETE ratings FROM store.product
WHERE id = 133346
IF EXISTS;

DELETE type FROM store.product
WHERE id = 754388
IF type = ['c'];

DELETE type[1] FROM store.product
WHERE id = 117452
IF EXISTS;


#Listar 5 produtos
SELECT * FROM product LIMIT 5;

#Morada do customer Gustavo Silva
SELECT address, name
FROM customer WHERE email = 'gustasilvaa@hotmail.com';

#Listar o numero de compras da 'Andreia Castelo'
SELECT customer, COUNT(*) 
FROM store.purchase
WHERE customer = 'andrcas@gmail.com' ALLOW FILTERING;

#Listar  o id dos produtos e suas quantidades da venda 16378
SELECT pur_id, products
FROM purchase WHERE pur_id = 16378;

#Listar o id dos produtos e suas quantidades da order 3222
SELECT order_id, prod
FROM orderr WHERE order_id = 3222;

#Listar o nome dos produtos com pelo menos um rating de 10
SELECT name,ratings 
FROM product 
WHERE ratings CONTAINS 10 ALLOW FILTERING;

#Listar o nome dos produtos do type 's'
SELECT name,type 
FROM product 
WHERE type CONTAINS 's' ALLOW FILTERING;

#Listar os providers que fizeram orders com o product 640444
SELECT provider,prod 
FROM orderr 
WHERE prod CONTAINS KEY 640444 ALLOW FILTERING;

#Apresentar o preco mais alto, mais barato e  media dos precos
SELECT max(price), min(price), avg(price)
FROM product;

#Listar produtos que custam mais que 5.0
SELECT *
FROM product WHERE price > 5.0 
ALLOW FILTERING;