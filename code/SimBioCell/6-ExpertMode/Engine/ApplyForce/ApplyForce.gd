tool
extends VisualScriptCustomNode

var _Preload = preload("res://SimBioCell/6-ExpertMode/Engine/ApplyForce/Spt_ApplyForce.gd") # Relative path
var _Script = _Preload.new()

func _get_caption():
	return "Apply Forces"

func _get_category():
	return "SimCells"

func _step(inputs, outputs, start_mode, working_mem):


	_Script.run(inputs[0],inputs[1],inputs[2],inputs[3],inputs[4],inputs[5])
	outputs[0] = inputs[0]
	return 0
	
# **************
# *  SEQUENCE  *
# **************
func _has_input_sequence_port():
	return true
func _get_output_sequence_port_count():
	return 1
	
# ************
# *  INPUT   *
# *************
func _get_input_value_port_count():
	return 6
func _get_input_value_port_name(idx):
	match idx:
		0:
			return "Agent"
		1:
			return "Group"
		2:
			return "Speed"
		3:
			return "x force"
		4:
			return "y force"
		5:
			return "z force"

func _get_input_value_port_type(idx):
	match idx:
		0:
			return TYPE_OBJECT
		1:
			return TYPE_STRING
		2:
			return TYPE_REAL
		3:
			return TYPE_INT
		4:
			return TYPE_INT
		5:
			return TYPE_INT

	
# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 1
func _get_output_value_port_name(idx):
	match idx:
		0:
			return "agent"

func _get_output_value_port_type(idx):
	match idx:
		0:
			return TYPE_OBJECT

