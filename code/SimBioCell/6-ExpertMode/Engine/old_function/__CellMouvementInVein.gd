tool
extends VisualScriptCustomNode

var _CellMouvementInVeinMain = preload("res://SimBioCell/6-ExpertMode/Engine/old_function/spt_cellMouvementInVein.gd") # Relative path
var CellMouvementInVeinMain = _CellMouvementInVeinMain.new()

func _get_caption():
	return "CellMouvementInVein"

func _get_category():
	return "SimCells"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _step(inputs, outputs, start_mode, working_mem):

	#print("Entering ForceRndXZ...")
	CellMouvementInVeinMain.run(inputs[0],inputs[1],inputs[2],inputs[3])
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
	return 4
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"
	elif idx == 1:
		return "Group"
	elif idx == 2:
		return "Speed"
	elif idx == 3:
		return "Axe (x/y/z)"
	return "default"
func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_INT
	elif idx == 3:
		return TYPE_STRING
	return TYPE_OBJECT
	
# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 1
func _get_output_value_port_name(idx):
	if idx == 0:
		return "pass"
	return "default"	
func _get_output_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	return TYPE_OBJECT
