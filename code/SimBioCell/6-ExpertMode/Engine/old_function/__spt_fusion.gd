extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func run(agent : Object, group : String, scaleMax : int):
	var made:bool 	= false
	var bodies = agent.get_colliding_bodies()
	if bodies.size() > 0:
		#print(bodies[0].name)
		if agent.is_in_group(group) and agent.is_queued_for_deletion() == false :
			for b in bodies:
				if b.is_in_group(group) and b.is_queued_for_deletion() == false:
					if(agent.get_scale()[0]+b.get_scale()[0] <= scaleMax):
						print("fusion")
						var cpt = 1
						print(agent.get_scale())
						print(b.get_scale())
						var scale = agent.get_scale()+b.get_scale()
						b.queue_free()
						agent.set_scale(scale)
	return made


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
