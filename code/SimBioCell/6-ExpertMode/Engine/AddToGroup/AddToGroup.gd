tool
extends VisualScriptCustomNode

var _AddToGroup = preload("res://SimBioCell/6-ExpertMode/Engine/AddToGroup/Spt_AddToGroup.gd") # Relative path
var AddToGroup = _AddToGroup.new()

func _get_caption():
	return "AddToGroup"

func _get_category():
	return "SimCells"

func _step(inputs, outputs, start_mode, working_mem):

	#print("Entering ForceRndXZ...")
	AddToGroup.run(inputs[0],inputs[1],inputs[2])
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
	elif idx == 2:
		return "GroupToAdd"
	return "default"
func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_STRING
	return TYPE_OBJECT
	
# *****************************************************
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
