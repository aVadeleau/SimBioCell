tool
extends VisualScriptCustomNode

var _Transformation = preload("res://SimBioCell/6-ExpertMode/Engine/old_function/spt_transformCondition.gd") # Relative path
var Transformation = _Transformation.new()

func _get_caption():
	return "TransformationCondition"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	
	
	Transformation.run(inputs[0],inputs[1],inputs[2],inputs[3]) # in the box, return true if the reaction has been made, else it returns false
	outputs[0] = inputs[0]
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
		return "group"
	elif idx == 2:
		return "object to create"
	elif idx == 3:
		return "condition"

func _get_input_value_port_type(idx):
	if idx == 0:
		return RigidBody
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_STRING
	elif idx == 3 :
		return TYPE_BOOL
	return TYPE_OBJECT
# *************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 1
func _get_output_value_port_name(idx):
	if idx == 0:
		return "agent"
	return "default"	
func _get_output_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	return TYPE_OBJECT
