extends Node

func run(agent : Object, group : String, ObjectToMultiply : String, limit : int, chance : int):
	var made:bool = false
	var animals = agent.get_parent().get_parent().get_child(0).get_children()
	var nbAnimal = 0
	for a in animals:
		if a.is_in_group(group):
			nbAnimal+=1
	if nbAnimal + 1 <= limit:
		var random_number = randi()%chance
		if(random_number==0):
			if agent.is_in_group(group):
				var newAnimal = load("res://SimBioCell/3-PrefabAgents/"+ObjectToMultiply+".tscn").instance()
				newAnimal.translate(agent.translation)
				agent.get_parent().get_parent().get_child(0).add_child(newAnimal)
				made = true
	return made # in the box, return true if the reaction has been made, else it returns false
