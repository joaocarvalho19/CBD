Neste exercicio está implementado um programa que tem as seguintes funcionalidades:

    1) Adição de utilizadores.
    2) Associação entre utilizadores (e.g. se userA segue userB, então userA deve ter
        informação sobre todas as mensagens enviadas por userB para o sistema).
    3) Envio de mensagens, por exemplo:
        storeMsg(userA, “Isto vai ser fácil!”).
    4) Leitura de mensagens (por utilizador)
    5) Impressão de todos os utilizadores


1) Para a adição de utilizadores usa-se um set "user" que contém todos os users

2) Para subscrever um user usa-se um hashmap "userSubs".
Digita-se o nome do utilizador(user1) e o nome do utilizador que se quer subscrever(user2)
Quando um utilizador subscreve mais que um utilizador usa-se o formato - "Joao_David_Gustavo" (Por exemplo)

3) Para enviar as mensagens usa-se uma list que se denomina "user_" concatenado com o nome do user ("user_"+user) e que 
contém todas as mensagens escritas por esse user

4) Para ler as mensagens digita-se o seu username, percorre-se as suas subscrições(com split("_")) e imprime-se as 
mensagens guardadas destes.