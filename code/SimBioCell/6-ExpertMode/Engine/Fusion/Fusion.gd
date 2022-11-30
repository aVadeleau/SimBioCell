tool
extends VisualScriptCustomNode

var _Fusion = preload("res://SimBioCell/6-ExpertMode/Engine/Fusion/Spt_Fusion.gd") # Relative path
var Fusion = _Fusion.new()

func _get_caption():
	return "Fusion"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	
	
					
	outputs[0] = Fusion.run(inputs[0],inputs[1],inputs[2],inputs[3]) # in the box, return true if the reaction has been made, else it returns false

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
	match idx :
		0:
			return "Agent"
		1:
			return "Agent2"
		2:
			return "group"
		3:
			return "Scale max"

func _get_input_value_port_type(idx):
	match idx :
		0:
			return RigidBody
		1:
			return RigidBody
		2:
			return TYPE_STRING
		3:
			return TYPE_INT

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
		return TYPE_BOOL
	return TYPE_OBJECT
