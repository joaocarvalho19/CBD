from neo4j import GraphDatabase, basic_auth


class HelloWorldExample(object):

    def __init__(self, uri, user, password):
        self._driver = GraphDatabase.driver(uri, auth=(user, password))

    def  insert_nodes(self):
       with  self._driver.session() as session:
			
            print("Inserting Player")
            session.run(
				"LOAD CSV WITH HEADERS FROM 'file:///football_salaries.csv' AS line MERGE (player:Player {name: line.player}) SET player.age=line.age, player.total_value=line.total_value, player.avg_year=line.avg_year, player.total_guaranteed=line.total_guaranteed, player.fully_guaranteed=line.fully_guaranteed, player.free_agency=line.free_agency")

            print("Inserting Team")
            session.run(
				"LOAD CSV WITH HEADERS FROM 'file:///football_salaries.csv' AS line MERGE (yeam:Team {team: line.team})")
		
            print("Inserting Posictions")
            session.run(
				"LOAD CSV WITH HEADERS FROM 'file:///football_salaries.csv' AS line MERGE (position:Position {type: line.position})")

    
    def insert_relations(self):
        with  self._driver.session() as session:

            print("\nTeam Relationships")
            session.run(
				"LOAD CSV WITH HEADERS FROM 'file:///football_salaries.csv' AS line MATCH(player:Player {name: line.player}),(team:Team {number: line.team}) CREATE (player)-[:TEAM]->(team)")

            print("\nPosition Relationships")
            session.run(
				"LOAD CSV WITH HEADERS FROM 'file:///football_salaries.csv' AS line MATCH(player:Player {name: line.player}),(position:Position {position: line.position}) CREATE (player)-[:POS]->(position)")
	

    def queries(self):
        with  self._driver.session() as session:
            print("QUERY 1:\n")
            for result in session.run("MATCH (n:Player) RETURN n.name LIMIT 25"):
                print(result)
            
            print("QUERY 2:\n")
            for result in session.run("MATCH (n:Player) WITH toInt(n.total_value) as Value,n RETURN Value,n.name as Name ORDER BY Value DESC LIMIT 25;"):
                print(result)
            
            print("QUERY 3:\n")
            for result in session.run("MATCH (n:Player) WITH toInt(n.age) as Media_idades RETURN avg(Media_idades)"):
                print(result)

            print("QUERY 4:\n")
            for result in session.run("MATCH (n:Team) RETURN n LIMIT 25"):
                print(result)

            print("QUERY 5:\n")
            for result in session.run("MATCH (n:Position) RETURN n"):
                print(result)


    def close(self):
        self._driver.close()


if  __name__ == "__main__":
    controller = HelloWorldExample(
		"bolt://localhost:7687", "neo4j", "1234")
    #controller.insert_nodes()
    #controller.insert_relations()
    controller.queries()
    controller.close()