tool
extends VisualScriptCustomNode

var _spt = preload("res://SimBioCell/6-ExpertMode/Engine/GroupCollision/spt_GroupCollision.gd")
var spt = _spt.new()

func _get_caption():
	return "Group Collision"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	var sortie = spt.run(inputs[0], inputs[1], inputs[2])
	outputs[0] = sortie[0]
	outputs[1] = sortie[1]
	outputs[2] = sortie[2]
	return 0

# **************
# *  SEQUENCE  *
# **************
func _has_input_sequence_port():
	return true
func _get_output_sequence_port_count():
	return 1

# *************
# *  INPUTS   *
# *************
func _get_input_value_port_count():
	return 3

func _get_input_value_port_name(idx):
	match idx:
		0:
			return "Agent"
		1:
			return "Detector Group"
		2:
			return "Detected Group"

func _get_input_value_port_type(idx):
	match idx:
		0:
			return TYPE_OBJECT
		1:
			return TYPE_STRING
		2:
			return TYPE_STRING

# *************
# *  OUTPUTS  *
# *************
func _get_output_value_port_count():
	return 3

func _get_output_value_port_name(idx):
	match idx:
		0:
			return "Collision ?"
		1:
			return "Detector Object"
		2:
			return "Detected Object"

func _get_output_value_port_type(idx):
	match idx:
		0:
			return TYPE_BOOL
		1:
			return TYPE_OBJECT
		2:
			return TYPE_OBJECT
