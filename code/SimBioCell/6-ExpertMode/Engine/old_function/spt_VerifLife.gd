extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func run(agent :Object, group : String, ageMax : int):
	if agent.is_in_group(group):
		if(agent.has_meta("age")):
			if(agent.get_meta("age") > ageMax):
				return true
	return false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
