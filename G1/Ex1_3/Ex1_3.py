import redis


def saveUser_List(l,r,username):
    r.lpush(l, username)
    string = "Username {} added!".format(username)
    print(string)

def getUser_List(l,r):
    return r.smembers(l)

def getAll_List(l,r):
    print("All Users: ")
    while(r.llen(l)!=0):    
        print(r.lpop(l))

        "------------------------------------"

def save_Hash(h,r,key,val):
    r.hset(h,key , val)
    print("Added in HashMap!")

def val_return(h,r,key):
    v = r.hget(h,key)
    string = "Value for the key {} is: {}".format(key,v)
    print(string)

def getAll_Hash(h,r):
    print(r.hgetall(h))


if __name__ == "__main__":

    USERS_LIST = 'users_list'
    USERS_HASH = 'users_hash'
    r = redis.Redis(host='localhost', port=6379, db=0)
    print("Redis!")
    print("------------------LIST------------------")
    users = ["Jorge","David","Alexandre","Maria","Ana"]
    for u in users:
        saveUser_List(USERS_LIST,r,u)
    
    getAll_List(USERS_LIST,r)
    print("------------------HASH------------------")
    save_Hash(USERS_HASH,r,"name","Pedro")
    save_Hash(USERS_HASH,r,"age","13")
    save_Hash(USERS_HASH,r,"genre","male")

    val_return(USERS_HASH,r,"name")

    getAll_Hash(USERS_HASH,r)