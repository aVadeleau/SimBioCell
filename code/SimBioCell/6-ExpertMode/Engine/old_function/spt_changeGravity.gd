extends Node

func run(agent : RigidBody, group_agent : String, group_zone : String, gravity_scale : float):
	if agent.is_in_group(group_agent):
		var bodies = agent.get_colliding_bodies()
		if bodies.size() > 0:
			for b in bodies:
				if b.is_in_group(group_zone):
					agent.gravity_scale = gravity_scale
	return 0
