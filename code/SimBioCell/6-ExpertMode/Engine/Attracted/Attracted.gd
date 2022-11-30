tool
extends VisualScriptCustomNode

var _preload = preload("res://SimBioCell/6-ExpertMode/Engine/Attracted/Spt_Attracted.gd")
var _script = _preload.new()

func _get_caption():
	return "Attracted"

func _get_category():
	return "SimCells"




# *****************************************************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	if inputs[2] < 0 :
		inputs[2] = 0.1
	_script.run(inputs[0], inputs[1],  inputs[2])
	
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
		return "Attracted to"
	elif idx == 2:
		return "Speed"
	return "default"
func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	elif idx == 1:
		return TYPE_OBJECT
	elif idx == 2:
		return TYPE_REAL
	return TYPE_OBJECT

# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 0
func _get_output_value_port_name(idx):
	return "default"	
func _get_output_value_port_type(idx):
	return TYPE_OBJECT
