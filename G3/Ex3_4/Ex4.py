from cassandra.cluster import Cluster
from cassandra.query import tuple_factory


cluster = Cluster()


session = cluster.connect('partilhavideos')

rows = session.execute("SELECT * FROM utilizador")

def insertUtilizador():
    session.execute(

        "INSERT INTO partilhaVideos.utilizador (username, nome_utilizador, email, selo_registo) VALUES ('opoc123', 'Olavo Cerdeira', 'opoc@hotmail.com', '2017-05-01');"

    )
    return "Utilizador adicionado!"



def pesquisarCom():

    rows = session.execute("SELECT video_id, comentario FROM comentarios WHERE video_id = 15167") 
    for row in rows:
        print (row[0], row[1])

   
    return "Acima estao os Comentarios do video '15167'!"

def alterarEve():

    session.execute("UPDATE partilhavideos.videos SET name = '20 Melhores Dicas' WHERE video_id = 82920 IF EXISTS;") 

    return "Alterado o titulo do video '10 Melhores Dicas' para '20 Melhores Dicas' !"
print("----------------")
print(insertUtilizador())
print("----------------")
print(pesquisarCom())
print("----------------")
print(alterarEve())
print("----------------")