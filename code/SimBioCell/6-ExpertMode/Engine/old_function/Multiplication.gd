tool
extends VisualScriptCustomNode

var mulitplication_preload = preload("res://SimBioCell/7-ExpertMode/Engine/Spt_Multiplication.gd")
var spt_multiplication = mulitplication_preload.new()

func _get_caption():
	return "Multiplication"

func _get_category():
	return "SimCells"

# *************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	outputs[0] = spt_multiplication.run(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4])
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
	return 5
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"
	elif idx == 1:
		return "Group"
	elif idx == 2:
		return "Object to multiply"
	elif idx == 3:
		return "Limit"
	elif idx == 4:
		return "Chance"
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
	elif idx == 4:
		return TYPE_INT
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
