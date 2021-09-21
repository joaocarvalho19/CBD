from cassandra.cluster import Cluster
import datetime
import random

def insert_user(session, username, name_user, email):
    d = str(datetime.datetime.now()).split(" ")[0]
    session.execute("INSERT INTO partilhavideo.user (username, name_user, email, selo_registo) VALUES ('{}','{}','{}','{}');".format(username, name_user, email, d))
    print("\nUser saved -",name_user)


def search_user(session, username):
    result = session.execute("SELECT * FROM user WHERE username = %s", [username]).one()
    print("\n Username:",result.username, "\n Fullname:",result.name_user,"\n Email:",result.email)
    
def update_user(session, username, email):
    session.execute("UPDATE user SET email =%s WHERE username = %s", [email, username])

#-----------------------------------------------

def insert_video(session, username, name, description,tags):
    d = str(datetime.datetime.now()).split(" ")[0]
    video_id = random.randint(0, 10000)
    tag = {'#'}
    for t in tags.split(","):
        tag.add(t)
    session.execute("INSERT INTO partilhavideo.videos (video_id,username, name, description, tag,selo_temporal) VALUES ({},'{}','{}','{}',{},'{}');".format(video_id,username, name, description,tag, d))
    print("\nVideo saved -",name)


def search_video(session, name):
    result = session.execute("SELECT * FROM videos WHERE name = %s ALLOW FILTERING;", [name]).one()
    print("\n Name:",result.name, "\n description:",result.description,"\n Tags:",result.tag)
    
def update_video(session, id, description):
    session.execute("UPDATE videos SET description =%s WHERE video_id = %s IF EXISTS;", [description, int(id)])

#---------------------------------------------

def insert_comment(session, comment, video_id,author):
    com_date = str(datetime.datetime.now()).split(" ")[0]
    id =random.randint(0, 10000)
    session.execute("INSERT INTO partilhavideo.comments (id,comment, video_id, com_date,author) VALUES ({},'{}',{},'{}','{}');".format(id,comment, int(video_id), com_date,author))
    print("\nComment saved!")

def update_comment(session, id, comment):
    session.execute("UPDATE comments SET comment =%s WHERE id = %s", [comment, int(id)])



def main():
    cluster = Cluster()
    session = cluster.connect('partilhavideo')

    ans=True
    while ans:
        print ("""
        1. INSERT data  
        2. EDIT data
        3. SEARCH data
        9. Exit/Quit
		""")
        ans=input("What would you like to do? ")
        if ans=="1":
            print ("""
            a. INSERT user  
            b. INSERT video
            c. INSERT comment
		    """)

            res=input("Choose the table:")

            if res == "a":
                username = input("Type username: ")
                name_user = input("Type your name: ")
                email = input("Type you email: ")
                insert_user(session,username,name_user,email)

            if res == "b":
                username = input("Type your username: ")
                name = input("Type video name: ")
                description = input("Type description: ")
                tags = input("Type video tags(Ex: tag,tag): ")
                insert_video(session,username,name,description,tags)
            if res == "c":
                comment = input("Type comment: ")
                video_id = input("Type video id: ")
                author = input("Type your username: ")
                insert_comment(session, comment, video_id,author)

        elif ans=="2":
            print ("""
            a. EDIT user email
            b. EDIT video description
            c. EDIT comment
		    """)

            res=input("Choose the table:")

            if res == "a":
                result = session.execute("SELECT * FROM user")
                for res in result:
                    print("-->",res.username)
                username = input("Type your username: ")
                email = input("Type new email: ")
                update_user(session,username,email)

            if res == "b":  
                result = session.execute("SELECT * FROM videos")
                for res in result:
                    print("-->",res.video_id)
                id = input("Type video id: ")
                description = input("Type new description: ")
                update_video(session,id,description)

            if res == "c":
                result = session.execute("SELECT * FROM comments")
                for res in result:
                    print("-->",res.id)
                id = input("Type comment id: ")
                comment = input("Type new comment: ")
                update_comment(session, id, comment)

        elif ans=="3":
            print ("""
            a. SEARCH user  
            b. SEARCH video
		    """)

            res=input("Choose the table:")
            if res == "a":
                result = session.execute("SELECT * FROM user")
                for res in result:
                    print("-->",res.username)
                username = input("Type username: ")
                search_user(session,username)

            if res == "b":
                result = session.execute("SELECT * FROM videos")
                for res in result:
                    print("-->",res.name)
                name = input("Type video name: ")
                search_video(session,name)

        elif ans=="9":
            print("\n Goodbye")
            ans = False
        elif ans !="":
            print("\n Not Valid Choice Try again")

if __name__ == "__main__":
    main()