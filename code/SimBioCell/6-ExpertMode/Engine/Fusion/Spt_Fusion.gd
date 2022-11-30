extends Node

func run(agent : Object, agent2 : Object, group : String, scaleMax : int):
	var made:bool 	= false
	if agent.is_in_group(group) and agent2.is_in_group(group):
		if(agent.get_scale()[0]+agent2.get_scale()[0] <= scaleMax):
			if(agent.get_instance_id() > agent2.get_instance_id()):
				print("fusion")
				var scale = agent.get_scale()+agent2.get_scale()
				agent2.queue_free()
				agent.set_scale(scale)
				made = true
	return made


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
