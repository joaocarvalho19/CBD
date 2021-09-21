CREATE TABLE partilhaVideo.user (
   username text, 
   name_user text,
   email text,
   selo_registo date,
   PRIMARY KEY (username)
);

CREATE TABLE partilhaVideo.videos(
    video_id int,
    username text,
    name text,
    description text,
    tag set<text>,
    selo_temporal date,
    PRIMARY KEY(video_id)
);

CREATE TABLE partilhaVideo.comments(
    id int,
    comment text,
    video_id int,
    com_date date,
    author text,
    PRIMARY KEY (author, com_date)
);  

CREATE TABLE partilhaVideo.events(
    author text,
    video_id int,
    type text,
    temporal_reg timestamp,
    temporal_moment timestamp,
    PRIMARY KEY (video_id,author,temporal_moment,temporal_reg)) WITH CLUSTERING ORDER BY (author ASC, temporal_moment ASC, temporal_reg DESC);



CREATE TABLE partilhaVideo.rating(
    rating_id int,
    rating_value int,
    video_id int,
    PRIMARY KEY (rating_id)
);  



INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('manuel10', 'Manuel Gomes', 'manuel10@hotmail.com', '2017-05-05');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('rute2', 'Rute Figueiredo', 'rf@hotmail.com', '2014-02-05');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('ruqr', 'Rui Pinheiro', 'ruip@hotmail.com', '2014-04-02');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('claferr', 'Cláudia Ferreira', 'cferr@hotmail.com', '2011-02-01');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('jolho', 'João Carvalho', 'joao.carvalho19@hotmail.com', '2012-11-26');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('adrc', 'Andreia Castelo', 'andrcas@gmail.com', '2013-12-25');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('franc11', 'Francisco Santos', 'fransantos11@hotmail.com', '2012-02-01');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('matilde1999', 'Matilde Fernandes', 'matilde12@gmail.com', '2012-03-31');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('paulu90', 'Paulo Roberto', 'proberto@hotmail.com', '2012-09-23');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('gusta_222', 'Gustavo Silva', 'gustasilvaa@hotmail.com', '2014-09-24');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('inocas_olsen', 'Inês Olsen', 'olsen_in@hotmail.com', '2015-03-14');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('alice14', 'Alice Gonçalves', 'aliceegon@hotmail.com', '2016-05-03');
INSERT INTO partilhaVideo.user (username, name_user, email, selo_registo) VALUES ('will99', 'Wilson Johnson', 'wiljohn@hotmail.com', '2017-07-01');

INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (15167, 'matilde1999', 'Olá Pessoal!', 'aqui temos um video!', {'#djosdijv','#ahc','#poiqwe'},'2017-07-01');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (82920,'paulu90', '10 Melhores Dicas', 'oi!', {'#asfqav','#afadv','#ghnd'},'2017-07-08');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (18990,'will99', 'Interesses Demográficos', 'muito interessante!', {'#saazz','#gjrf','#xxcdfe'},'2014-07-01');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (16738,'matilde1999', 'Pense Sobre o Domínio do Website e Mídia Social', 'Comentem!', {'#qwqrtyyy','#mmnmnn','#sssw'},'2015-11-04');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (00983,'claferr', 'Ha certeza de que você pode explicar', 'video!', {'#sdfG','#ahc','#poiqwe'},'2019-01-21');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (13426,'alice14', 'Entre?', 'hallo!', {'#djosdijv','#vvb','#poiqwe'},'2017-07-01');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (12215,'paulu90', 'Olá !', 'viva o natal!', {'#tio','#vvvndfd','#poiqwe'},'2016-02-09');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (23467, 'jolho', 'Vejam Rapido!', 'aqui temos um video!', {'#aregav','#ahc','#poiqwe'},'2017-07-01');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (23420,'franc11', 'Como ficar rico', 'oi!', {'#asfqav','#aregh','#ghnd'},'2017-07-08');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (26590,'rute2', 'Um video', 'muito interessante!', {'#saazz','#hhhee','#xxcdfe'},'2014-07-01');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (22738,'matilde1999', 'Vai andando, vou só levantar dinheiro', 'Comentem!', {'#qwqrtyyy','#mmnmnn','#sssw'},'2015-11-04');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (26983,'claferr', 'Adoro Ferias!', 'video!', {'#sdfG','#ahc','#ujnum'},'2019-01-21');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (52426,'will99', 'Ferias Fantasticas', 'hallo!', {'#djosdijv','#poiu','#poiqwe'},'2017-07-01');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (31215,'paulu90', 'Voce vai gostar', 'viva o natal!', {'#sobrinho','#vvvndfd','#poiqwe'},'2016-02-09');
INSERT INTO partilhavideo.videos (video_id,username,name,description,tag,selo_temporal) VALUES (11113,'paulu90', 'Voce vai adorar', 'viva!', {'#sobrinho','#vvvndfd','Aveiro'},'2016-02-09');


INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (15167,'Interesses Demográficos', 82920,'2012-07-01','gusta_222');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (12412,'10 Melhores Dicas', 15167,'2013-05-02','alice14');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (83739,'Olá Pessoal!', 15167,'2015-08-01','alice14');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (11536,'Olá Pessoal!', 12215,'2011-09-02','paulu90');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (34621,'Olá Pessoal!', 13426,'2019-09-01','adrc');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (56653,'Entre?', 00983,'2018-07-08','jolho');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (12427,'Entre?', 13426,'2013-05-04','jolho');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (12112,'Pense Sobre o Domínio do Website e Mídia Social', 00983,'2017-07-01','rute2');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (15247,'Impressionante', 82920,'2013-07-01','gusta_222');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (12912,'Excelente!', 23467,'2015-07-01','alice14');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (84339,'Não Fazes outra', 15167,'2015-03-01','alice14');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (31536,'Pensa em ti', 23467,'2011-01-01','paulu90');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (22621,'Nao desistas ', 13426,'2012-02-01','adrc');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (88653,'Adoro isto!', 26983,'2013-07-03','jolho');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (67427,'Nao quero saber', 13426,'2015-07-03','jolho');
INSERT INTO partilhavideo.comments (id,comment,video_id,com_date,author) VALUES (15112,'Pense bem', 23420,'2016-03-06','rute2');


INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('alice14', 16738,'play',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('paulu90', 00983,'pause',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('jolho', 12215,'stop',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('paulu90', 82920,'play',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('alice14', 82920,'pause',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('adrc', 16738,'stop',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('rute2', 00983,'play',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('will99', 13426,'stop',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));
INSERT INTO partilhavideo.events (author,video_id,type,temporal_reg,temporal_moment) VALUES ('claferr', 18990,'pause',toTimeStamp(toDate(now())),toTimeStamp(toDate(now())));


INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (12325,2, 82920);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (98721,4, 15167);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (68910,2, 15167);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (76129,5, 12215);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (42081,5, 13426);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (83275,2, 00983);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (32962,4, 13426);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (56899,5, 00983);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (22345,5, 82920);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (43622,5, 23467);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (67999,4, 15167);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (07800,4, 23467);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (78665,1, 13426);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (75988,2, 26983);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (46789,3, 13426);
INSERT INTO partilhavideo.rating (rating_id,rating_value,video_id) VALUES (41188,3, 23420);




SELECT * FROM videos WHERE username='matilde1999' ALLOW FILTERING ;

SELECT * FROM comments WHERE video_id=12412 ALLOW FILTERING ;

SELECT * FROM comments WHERE video_id=13426 ALLOW FILTERING ;

SELECT avg(rating_value),video_id FROM rating  WHERE video_id=15167 ALLOW FILTERING ;

#1
SELECT * FROM partilhavideo.comments ORDER BY com_date DESC LIMIT 3;

#2
SELECT name,tag FROM partilhavideo.videos WHERE video_id=31215 ALLOW FILTERING ;

#3
SELECT name,tag 
FROM videos 
WHERE tag CONTAINS 'Aveiro' ALLOW FILTERING;
