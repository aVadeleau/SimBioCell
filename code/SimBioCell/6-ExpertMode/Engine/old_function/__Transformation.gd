tool
extends VisualScriptCustomNode

var _Transformation = preload("res://SimBioCell/6-ExpertMode/Engine/old_function/spt_transformation.gd") # Relative path
var Transformation = _Transformation.new()

func _get_caption():
	return "Transformation"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	
	
	outputs[0] = Transformation.run(inputs[0],inputs[1],inputs[2],inputs[3],inputs[4],inputs[5],inputs[6]) # in the box, return true if the reaction has been made, else it returns false
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
	return 7
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"
	elif idx == 1:
		return "transformed"
	elif idx == 2:
		return "transformer"
	elif idx == 3:
		return "object to create"
	elif idx == 4:
		return "probability"
	elif idx == 5:
		return "delete transformer item ?"
	elif idx == 6:
		return "delete previous transformed item ?"
	return "default"
func _get_input_value_port_type(idx):
	if idx == 0:
		return RigidBody
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_STRING
	elif idx == 3:
		return TYPE_STRING
	elif idx == 4:
		return TYPE_INT
	elif idx == 5:
		return TYPE_BOOL
	elif idx == 6:
		return TYPE_BOOL
	return TYPE_OBJECT
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
