extends Node

func  run(agent : Object, x_axis : float, y_axis : float, z_axis : float):
	var torque = Vector3(x_axis, y_axis, z_axis)
	agent.apply_central_impulse(torque)
	return 0
