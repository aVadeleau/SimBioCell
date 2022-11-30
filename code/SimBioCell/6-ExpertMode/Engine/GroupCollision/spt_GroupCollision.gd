extends Node

##
# run
##
func run(agent : CollisionObject,
		detector_group : String, 
		detected_group : String):

	if agent.is_in_group(detector_group):
		var bodies = agent.get_colliding_bodies()
		if bodies.size() > 0:
			for b in bodies:
				if b.is_in_group(detected_group):
					return [true, agent, b]
	return [false, null, null]
