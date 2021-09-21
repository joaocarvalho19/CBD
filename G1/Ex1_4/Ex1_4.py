import redis

redis_host = "localhost"
redis_port = 6379
redis_password = ""
r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)

# Create the completion sorted set
if r.exists('compl') == False:
     print ("Carregando as entradas na DB Redis\n")
     f = open('female-names.txt',"r")
     for line in f:
        n = line.strip()         
        for l in range(1,len(n)):             
            prefix = n[0:l]             
            r.zadd('compl',{prefix:0})
        r.zadd('compl',{n+"*":0})
else:
    print ("Já estão as entradas na DB\n")



def complete(r,prefix,count):
    results = []
    rangelen = 50
    start = r.zrank('compl',prefix)    
    if not start:
         return []
    while (len(results) != count):         
         range = r.zrange('compl',start,start+rangelen-1)         
         start += rangelen
         if not range or len(range) == 0:
             break
         for entry in range:
             minlen = min(len(entry),len(prefix))             
             if entry[0:minlen] != prefix[0:minlen]:                
                count = len(results)
                break              
             if entry[-1] == "*" and len(results) != count:                 
                results.append(entry[0:-1])
     
    return results

def autoComplete():
    inp = input("Search for ('Enter' for quit): ")
    print (complete(r,inp,50))

if __name__ == "__main__":
    autoComplete()