extends Node

func run(agent : Object, attractedTo : Object, speed : float):
	var direction = agent.translation.direction_to(attractedTo.translation)
	var velocity = Vector3.ZERO
	velocity = velocity.move_toward(direction * speed, speed)
	agent.apply_central_impulse(velocity)
