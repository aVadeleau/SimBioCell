tool
extends VisualScriptCustomNode

var _spt = preload("res://SimBioCell/6-ExpertMode/Engine/old_function/spt_changeGravity.gd") # Relative path
var spt = _spt.new()

func _get_caption():
	return "Change Gravity"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	spt.run(inputs[0], inputs[1], inputs[2], inputs[3])
	return 0

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
	return 4

func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"
	elif idx == 1:
		return "Group to affect"
	elif idx == 2:
		return "Gravity Group"
	elif idx == 3:
		return "Gravity Scale"

func _get_input_value_port_type(idx):
	if idx == 0:
		return RigidBody
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_STRING
	elif idx == 3:
		return TYPE_REAL

# *************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 0

func _get_output_value_port_name(idx):
	return "default"	

func _get_output_value_port_type(idx):
	return TYPE_OBJECT
