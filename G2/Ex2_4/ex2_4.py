from pymongo import MongoClient
from random import randrange


def addRest(col, restau):
	col.insert_one(restau)
	print("Restaurant Added!")

def editRest():
	pass

def printRest(col):
	query = col.find({}, {'_id':0,'nome':1})
	for item in query:
		print(item)

def search(col, typ,value):
	res = col.find({typ: value}, {'_id':0})
	for item in res:
		print("---------------------------------")
		for i in item:
			print(i," --: ",item[i],"\n")
		print("---------------------------------")

def countLocalidades(col):
	l = []
	query = col.find({}, {'_id':0,'localidade':1})
	for item in query:
		if item not in l:
			l.append(item)
	print("Numero de localidades distintas: ",len(l))

def countRestByLocalidade(col):
	local_list = []
	query = col.find({}, {'_id':0,'localidade':1})
	print("Numero de restaurantes por localidade: ")
	for item in query:
		nome_list = []
		if item not in local_list:
			local_list.append(item)
			local = item.get("localidade")
			n = col.find({"localidade":local},{'_id':0,'nome':1})
			for i in n:
				nome_list.append(i)
			print("-->",local,"-",len(nome_list))


def countRestByLocalidadeByGastronomia(col):
	local_list = []
	query = col.find({}, {'_id':0,'localidade':1})
	print("Numero de restaurantes por localidade e gastronomia: \n")
	for item in query:
		gast_list = {}
		if item not in local_list:
			local_list.append(item)
			local = item.get("localidade")
			n = col.find({"localidade":local},{'_id':0,'gastronomia':1})
			for i in n:
				i = i.get("gastronomia")
				if i not in gast_list:
					gast_list[i]=1
				else:
					new = gast_list.get(i)+1
					gast_list[i] = new
			for x in gast_list:
				print(local,"|", x,"-",gast_list[x])


def getRestWithNameCloserTo(col,name):
	string = "/"+name+"/"
	query = col.find({ "$text": { "$search": name } }, {'_id':0,'nome':1})
	for item in query:
		print(item)
		#print("->",item.get("nome"))



if __name__ == '__main__':
	client = MongoClient()
	db = client.cbd
	col = db.rest

	ans=True
	while ans:
		print ("""
		1. Add a Restaurant
		2. Edit a Restaurant
		3. Search by Name
		4. Print Registos
		5. Localidades Count
		6. Numero de restaurantes por localidade
		7. Numero de restaurantes por localidade e gastronomia
		8. Pesquisar por nome parcial
		9. Exit/Quit
		""")
		ans=input("What would you like to do? ")
		if ans=="1":
			nome = input("Digite o nome do restaurante: ")
			gast = input("Digite a gastronomia: ")
			local = input("Digite a localidade onde se encontra: ")
			build = input("Digite o numero do building: ")
			rua = input("Digite a rua: ")
			zipc = input("Digite o zipcode: ")
			restau = {"address": {"building": build, "rua": rua, "zipcode": zipc},"localidade": local, "gastronomia": gast, "nome":nome, "restaurant_id":randrange(10000000)}
			addRest(col,restau)

		elif ans=="2":
			your_name = input("Type your name: ")
			subs_name = input("Type your subscription name: ")
		elif ans=="4":
			printRest(col)
		elif ans=="3":
			print ("""
			1. Por Localidade
			2. Por Gastronomia
			3. Por Nome
			""")
			escolha = input("Escolha: ")
			if escolha == "1":
				loc = input("Digite a localidade: ")
				search(col, "localidade", loc)
			if escolha == "2":
				gas = input("Digite a gastronomia: ")
				search(col, "gastronomia", gas)
			if escolha == "3":
				nome = input("Digite o nome: ")
				search(col, "nome", nome)
		elif ans=="5":
			countLocalidades(col)
		elif ans=="6":
			countRestByLocalidade(col)
		elif ans=="7":
			countRestByLocalidadeByGastronomia(col)
		elif ans=="8":
			nome = input("Digite o nome parcial: ")
			getRestWithNameCloserTo(col,nome)
		elif ans=="9":
			print("\n Goodbye")
			ans = False
		elif ans !="":
			print("\n Not Valid Choice Try again")