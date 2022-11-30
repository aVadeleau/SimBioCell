tool
extends VisualScriptCustomNode

func _get_caption():
	return "Cure"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	if(inputs[0] != null):
		var material = inputs[0].get_surface_material(0).duplicate()
		material.albedo_color = Color(0, 0, 1)
		inputs[0].set_surface_material(0, material)
		inputs[0].add_to_group("Cure")

# **************
# *  SEQUENCE  *
# **************
func _has_input_sequence_port():
	return true
func _get_output_sequence_port_count():
	return 1

# *************
# *  INPUT   *
# *************
func _get_input_value_port_count():
	return 1
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"

func _get_input_value_port_type(idx):
	if idx == 0:
		return RigidBody

# *************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 1
func _get_output_value_port_name(idx):
	if idx == 0:
		return "Made"
	return "default"	
func _get_output_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	return TYPE_OBJECT
