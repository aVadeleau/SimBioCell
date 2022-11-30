tool
extends VisualScriptCustomNode

var _VerifLife = preload("res://SimBioCell/6-ExpertMode/Engine/old_function/spt_VerifLife.gd") # Relative path
var VerifLife = _VerifLife.new()

func _get_caption():
	return "VerifLife"

func _get_category():
	return "SimCells"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _step(inputs, outputs, start_mode, working_mem):

	#print("Entering ForceRndXZ...")
	VerifLife.run(inputs[0],inputs[1],inputs[2])
	outputs[1] = VerifLife.run(inputs[0],inputs[1],inputs[2])
	outputs[0] = inputs[0]
	return 0
# *****************************************************
# *  SEQUENCE  *
# **************
func _has_input_sequence_port():
	return true
func _get_output_sequence_port_count():
	return 1

	
# *****************************************************
# *  INPUT   *
# *************
func _get_input_value_port_count():
	return 3
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"
	elif idx == 1:
		return "Group"
	elif idx==2:
		return "Age max"
	return "default"
func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_INT
	return TYPE_OBJECT
	
# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 2
func _get_output_value_port_name(idx):
	if idx == 0:
		return "Agent"
	if idx == 1:
		return "life state"
	return "default"	
func _get_output_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	if idx == 1:
		return TYPE_BOOL
	return TYPE_OBJECT
