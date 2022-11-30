extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func run(agent :Object, group : String, newGroup : String):
	if agent.is_in_group(group):
		#print("add grp :",newGroup)
		agent.add_to_group(newGroup)
	return 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
