def count_names():
    f = open("female-names.txt", "r")
    for x in f:
        if x[0] not in d:
            d[x[0]] = 1
        else:
            d[x[0]] += 1


    f2 = open("initials4redis.txt", "w")
    for i in d:
        string = ' SET {} {}\n'.format(i.upper(),d[i])
        print(string)
        f2.write(string)

    f2.close()

d = {}
count_names()