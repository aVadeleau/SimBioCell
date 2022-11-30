extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func run(agent :Object, group : String):
	if agent.is_in_group(group) or group == "":
		if(agent.has_meta("age")):
			agent.set_meta("age",agent.get_meta("age")+1)
			#print(agent.name)
		else:
			agent.set_meta("age",0)
		return 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
