import redis

redisClient = redis.Redis(host='localhost', port=6379, db=0)

def add_users(name):
    redisClient.sadd("user", name)

def show_users():
    print("\nAll users:")
    for m in redisClient.smembers("user"):
        print("->",m.decode("utf-8"))
    print("Number of users:",redisClient.scard("user"))

def storeMsg(user, message):
    redisClient.lpush("user_"+user,message)


def subs(user1, user2):
    if bytes(user1, 'utf-8') not in redisClient.hkeys("userSubs"):
        redisClient.hset("userSubs", user1, user2)
    else:
        val = redisClient.hget("userSubs",user1)
        final = val.decode("utf-8")+"_"+user2
        redisClient.hset("userSubs", user1, final)
    
    print(user1,"subscribed",user2)


def readMsg(user1):
    val = redisClient.hget("userSubs",user1)
    if val:
        val = val.decode("utf-8").split("_")
        print("")
        for u in val:
            if redisClient.llen("user_"+u)!=0:
                l = redisClient.lrange("user_"+u, 0, -1)
                for x in l:
                    print (u,"send: ",x.decode("utf-8"),"\n")
            else:
                print("No messages from",u,"\n")
    else:
        print(user1,"don't have subscriptions!")



if __name__ == '__main__':

    ans=True
    while ans:
        print ("""
        1. Add a User
        2. Subscrive a User
        3. Send Message
        4. Read sms
        5. See all Users
        6. Exit/Quit
        """)
        ans=input("What would you like to do? ") 
        if ans=="1":
            u = input("Type de user name: ")
            add_users(u)
        elif ans=="2":
            your_name = input("Type your name: ")
            subs_name = input("Type your subscription name: ")
            subs(your_name,subs_name)
        elif ans=="3":
            name = input("Type your name: ")
            msg = input("Type your message: ")
            storeMsg(name,msg)
        elif ans=="4":
            your_name = input("Type your name: ")
            readMsg(your_name)
        elif ans == "5":
            show_users()
        elif ans=="6":
            print("\n Goodbye")
            ans = False
        elif ans !="":
            print("\n Not Valid Choice Try again") 