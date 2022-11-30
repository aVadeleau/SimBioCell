tool
extends VisualScriptCustomNode

var _spt = preload("res://SimBioCell/6-ExpertMode/Engine/Mature/spt_Mature.gd")
var spt = _spt.new()

func _get_caption():
	return "Agent Maturing"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	spt.run(inputs[0], inputs[1], inputs[2])
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
			return "Group"
		2:
			return "Aging factor"

func _get_input_value_port_type(idx):
	match idx:
		0:
			return TYPE_OBJECT
		1:
			return TYPE_STRING
		2:
			return TYPE_REAL
