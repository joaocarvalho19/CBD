names  = open("female-names.txt", 'r')
n = names.readlines()

d = {}

for word in n:
    if word[0] not in d:
        d[word[0]] = 0
    d[word[0]] += 1

f = open("initials4redis.txt", "w")
for i in d:
	string="SET A {}\n".format(d[i])
	f.write(string)
f.close()