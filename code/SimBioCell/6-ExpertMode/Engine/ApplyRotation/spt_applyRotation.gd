extends Node

func  run(agent : Object, agent_group : String, x_axis : float, y_axis : float, z_axis : float):
	
	var torque = Vector3(x_axis, y_axis * agent.mass, z_axis)
	if(agent.is_in_group(agent_group)):
		agent.apply_torque_impulse(torque)
	return 0
