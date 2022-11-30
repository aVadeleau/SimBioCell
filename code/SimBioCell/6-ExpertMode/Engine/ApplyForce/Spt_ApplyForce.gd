extends Node


func run(agent : Object, group : String, speed : float, x : int, y :int, z :int ):
	if (agent.is_in_group(group)):
		var force = Vector3(x,y,z)
		agent.add_central_force(force.normalized()*speed)
		
