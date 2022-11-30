tool
extends VisualScriptCustomNode

var _preload = preload("res://SimBioCell/6-ExpertMode/Engine/GetPosition/Spt_GetPosition.gd") # Relative path
var _script = _preload.new()

func _get_caption():
	return "Get Position"

func _get_category():
	return "SimCells"

func _step(inputs, outputs, start_mode, working_mem):

	outputs[0] = _script.run(inputs[0])
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
	return 1
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"

func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	return TYPE_OBJECT
	
# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 1
func _get_output_value_port_name(idx):
	if idx == 0:
		return "Vector Position"
	return "default"	
func _get_output_value_port_type(idx):
	if idx == 0:
		return TYPE_VECTOR3
	return TYPE_OBJECT
