extends RigidBody
var reset = false
var init_x =0
var init_y =0
var init_z =0

func _integrate_forces(state):
	if(reset):
		if(init_x != 0):
			var coord = state.get_transform()
			coord.origin.x = init_x
			state.set_transform(coord)
			reset = false
		elif(init_y != 0):
			var coord = state.get_transform()
			coord.origin.y = init_y
			state.set_transform(coord)
			reset = false
		elif(init_z !=0):
			var coord = state.get_transform()
			coord.origin.z = init_z
			state.set_transform(coord)
			reset = false
		init_x=0
		init_y=0
		init_z=0
