extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func run(agent : Object, group :String , speed : int, axe : String):
	if agent.is_in_group(group):
		var x
		var y
		var z
		if (axe=="x"):
			x = rand_range(0,75)
			y = rand_range(-75,75)
			z = rand_range(-75,75)
		elif (axe=="y"):
			x = rand_range(-75,75)
			y = rand_range(0,75)
			z = rand_range(-75,75)
		elif (axe=="z"):
			x = rand_range(-75,75)
			y = rand_range(-75,75)
			z = rand_range(0,75)
		var force = Vector3(x,y,z)
		agent.add_central_force(force.normalized()*speed)
	return 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
