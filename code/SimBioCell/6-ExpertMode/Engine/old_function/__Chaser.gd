tool
extends VisualScriptCustomNode

func _get_caption():
	return "Chaser"

func _get_category():
	return "SimCells"

# *****************************************************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	#print("Entering ForceRndXZ...")
	if inputs[0].is_in_group("Chaser"):
		if inputs[0].is_in_group(inputs[2]):
			var newZone = Vector3(inputs[3],inputs[3],inputs[3])
			inputs[0].get_child(2).set_scale(newZone)
			var chaseDetection = inputs[0].get_child(2).get_overlapping_bodies()
			var layer = inputs[0].get_collision_layer()
			if chaseDetection.size() > 0:
				var theSheep = chaseDetection[0]
				if !theSheep.is_in_group(inputs[1]):
					var i = 1
					while !theSheep.is_in_group(inputs[1]) && i < chaseDetection.size():
						theSheep = chaseDetection[i]
						i += 1
				if theSheep.is_in_group(inputs[1]):
					inputs[0].remove_from_group("Bouge")
					var direction = inputs[0].position.direction_to(theSheep.position)
					var velocity = Vector3.ZERO
					velocity = velocity.move_toward(direction * 0.2, 0.2)
					inputs[0].apply_central_impulse(velocity)
				else:
					inputs[0].add_to_group("Bouge")
	elif inputs[0].is_in_group("Chased"):
		if inputs[0].is_in_group(inputs[1]):
			var newZone = Vector3(inputs[3],inputs[3],inputs[3])
			inputs[0].get_child(2).set_scale(newZone)
			var chaseDetection = inputs[0].get_child(2).get_overlapping_bodies()
			var layer = inputs[0].get_collision_layer()
			if chaseDetection.size() > 0:
				var theWolf = chaseDetection[0]
				if !theWolf.is_in_group(inputs[2]):
					var i = 1
					while !theWolf.is_in_group(inputs[2]) && i < chaseDetection.size():
						theWolf = chaseDetection[i]
						i += 1
				if theWolf.is_in_group(inputs[2]):
					inputs[0].remove_from_group("Bouge")
					var direction = inputs[0].position.direction_to(theWolf.position)
					var velocity = Vector3.ZERO
					velocity = velocity.move_toward(direction * -0.3, 0.3)
					inputs[0].apply_central_impulse(velocity)
				else:
					inputs[0].add_to_group("Bouge")
	return 0

# *****************************************************
# *  SEQUENCE  *
# **************
func _has_input_sequence_port():
	return true
func _get_output_sequence_port_count():
	return 1

# *****************************************************
# *  INPUT   *
# *************
func _get_input_value_port_count():
	return 4
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"
	elif idx == 1:
		return "Chased"
	elif idx == 2:
		return "Chaser"
	elif idx == 3:
		return "Detection size"
	return "default"
func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_STRING
	elif idx == 3:
		return TYPE_INT
	return TYPE_OBJECT

# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 1
func _get_output_value_port_name(idx):
	if idx == 0:
		return "pass"
	return "default"	
func _get_output_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	return TYPE_OBJECT
