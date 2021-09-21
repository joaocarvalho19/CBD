CREATE KEYSPACE store WITH REPLICATION = {'class' : 'SimpleStrategy','replication_factor' : 1};

CREATE TABLE store.client ( NIF int, name text, address text,emails set<text>,PRIMARY KEY (NIF));

CREATE TABLE store.product ( id UUID, name text, preco float, type list<text>,PRIMARY KEY (id));

CREATE TABLE store.purchase ( num int, quantity int,client int, products map<UUID,int>,PRIMARY KEY (num));

CREATE TABLE store.orderr ( numb int, quant int,provider text,prod map<UUID,int> ,PRIMARY KEY (numb));

CREATE TABLE store.provider ( email text, name text, address text, PRIMARY KEY (email));


INSERT INTO store.client (NIF, name, address, emails) VALUES (123456789, 'Manuel Gomes','Rua Dona Augusta', {'manuel10@hotmail.com','manuel10@ua.pt'});
INSERT INTO store.client (NIF, name, address, emails) VALUES (657917678, 'Rute Figueiredo','Rua de Cima', {'rf@hotmail.com'});
INSERT INTO store.client (NIF, name, address, emails) VALUES (981367890, 'Andreia Castelo','Rua de Baixo', {'andrcas@gmail.com','andrcas@ua.pt'});
INSERT INTO store.client (NIF, name, address, emails) VALUES (182639108, 'Gustavo Silva','Rua do Vale', {'gustasilvaa@hotmail.com','gustasilvaa@ua.pt','gstaaa@gmail.com'});

INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Detergente', 12.90, ['a','d','t','g']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Desengordurante', 10.99, ['b','a','t']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Limpador multiuso', 5.59, ['v','q']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Desinfetante', 4.49, ['b','d','p']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Luvas de borracha', 6.39, ['v','d']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Baldes', 3.99, ['a','d']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Panos de chão', 11.99, ['a','d']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Esponja', 2.59, ['b','p','t']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Álcool', 6.89, ['b','p']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Água sanitária', 7.89, ['b','e']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Limpa-vidros', 1.59, ['v']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Lustra-móveis', 1.29, ['e','s']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Esfregona', 17.79, ['a','s']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Gel', 9.59, ['e','d']);
INSERT INTO store.product (id, name , preco, type) VALUES (now(), 'Vassoura', 14.69, ['c']);

INSERT INTO store.provider (email, name, address) VALUES ('aliceegon@hotmail.com', 'Alice Gonçalves','Avenida Dona Almerinda');
INSERT INTO store.provider (email, name, address) VALUES ('wiljohn@hotmail.com', 'Wilson Johnson', 'Avenida Alto da Esperanca');
INSERT INTO store.provider (email, name, address) VALUES ('joao.carvalho19@hotmail.com', 'João Carvalho', 'Avenida Dona Almerinda');
INSERT INTO store.provider (email, name, address) VALUES ('ruip@hotmail.com', 'Rui Pinheiro', 'Rua do Espantalho');

INSERT INTO store.purchase (num, quantity,client, products) VALUES (16378, 2, 657917678, {01a72680-1550-11ea-bd65-ad7246e342e1: 2});
INSERT INTO store.purchase (num, quantity,client, products) VALUES (78390, 5, 182639108, {01a8d430-1550-11ea-bd65-ad7246e342e1: 3, 01b02730-1550-11ea-bd65-ad7246e342e1:1,01a61510-1550-11ea-bd65-ad7246e342e1:1});
INSERT INTO store.purchase (num, quantity,client, products) VALUES (23443, 1, 123456789, {01ad6810-1550-11ea-bd65-ad7246e342e1: 1});
INSERT INTO store.purchase (num, quantity,client, products) VALUES (12638, 5, 981367890, {01a61510-1550-11ea-bd65-ad7246e342e1: 2, 01b4bb10-1550-11ea-bd65-ad7246e342e1:2, 01a72680-1550-11ea-bd65-ad7246e342e1:1});
INSERT INTO store.purchase (num, quantity,client, products) VALUES (89208, 3, 123456789, {01a72680-1550-11ea-bd65-ad7246e342e1: 2, 01b29830-1550-11ea-bd65-ad7246e342e1:1});
INSERT INTO store.purchase (num, quantity,client, products) VALUES (66579, 2, 981367890, {01b53040-1550-11ea-bd65-ad7246e342e1: 1, 01b5cc80-1550-11ea-bd65-ad7246e342e1 :1});

INSERT INTO store.orderr (numb, quant,provider,prod) VALUES (7393, 2, 'wiljohn@hotmail.com', {01a72680-1550-11ea-bd65-ad7246e342e1: 1,01a61510-1550-11ea-bd65-ad7246e342e1: 1});
INSERT INTO store.orderr (numb, quant,provider,prod) VALUES (5156, 1, 'joao.carvalho19@hotmail.com', {01a8d430-1550-11ea-bd65-ad7246e342e1: 1});
INSERT INTO store.orderr (numb, quant,provider,prod) VALUES (2278, 4, 'aliceegon@hotmail.com', {01b02730-1550-11ea-bd65-ad7246e342e1: 2,01a72680-1550-11ea-bd65-ad7246e342e1:2});
INSERT INTO store.orderr (numb, quant,provider,prod) VALUES (3222, 6, 'ruip@hotmail.com', {01b53040-1550-11ea-bd65-ad7246e342e1: 3, 01b4bb10-1550-11ea-bd65-ad7246e342e1: 3});
INSERT INTO store.orderr (numb, quant,provider,prod) VALUES (6734, 3, 'joao.carvalho19@hotmail.com', {01a72680-1550-11ea-bd65-ad7246e342e1: 3});


UPDATE store.product
SET preco = 6.39
WHERE id = 01a72680-1550-11ea-bd65-ad7246e342e1 IF EXISTS;

UPDATE store.product
SET name = 'Gel de banho'
WHERE id = 01b53040-1550-11ea-bd65-ad7246e342e1 IF EXISTS;

UPDATE store.orderr
SET quant = 3, prod = {01a72680-1550-11ea-bd65-ad7246e342e1: 2,01a61510-1550-11ea-bd65-ad7246e342e1: 1}
WHERE numb = 7393 IF EXISTS;

DELETE FROM store.product
WHERE id = 01ac2f90-1550-11ea-bd65-ad7246e342e1;

DELETE preco FROM store.product
WHERE id = 01b3a9a0-1550-11ea-bd65-ad7246e342e1
IF EXISTS;


#mostrar 5 produtos
SELECT * FROM product LIMIT 5;

#nome do cliente com NIF 123456789
SELECT NIF, name
FROM client WHERE NIF = 123456789;

#quantidade de produtos da venda 16378
SELECT num, quantity
FROM purchase WHERE num = 16378;

#quantidade de produtos da encomenda 3222
SELECT numb, quant
FROM orderr WHERE numb = 3222;

#apresentar as compras ordenadas por quantidade
SELECT *
FROM store.product ORDER BY preco ASC;

#produtos que custam mais que 5.0
SELECT *
FROM product WHERE preco > 5.0 
ALLOW FILTERING;