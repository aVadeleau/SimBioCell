tool
extends VisualScriptCustomNode

var _spt = preload("res://SimBioCell/6-ExpertMode/Engine/AgentIsInGroup/spt_AgentIsInGroup.gd") # Absolute path to the script
var spt = _spt.new()

func _get_caption():
	return "Agent is in group"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	outputs[0]=spt.run(inputs[0], inputs[1])
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
	return 2

func _get_input_value_port_name(idx):
	match idx:
		0:
			return "Agent"
		1:
			return "Group"

func _get_input_value_port_type(idx):
	match idx:
		0:
			return TYPE_OBJECT
		1:
			return TYPE_STRING

# *************
# *  OUTPUTS  *
# *************
func _get_output_value_port_count():
	return 1

func _get_output_value_port_name(idx):
	match idx:
		0:
			return "Output"

func _get_output_value_port_type(idx):
	match idx:
		0:
			return TYPE_BOOL
