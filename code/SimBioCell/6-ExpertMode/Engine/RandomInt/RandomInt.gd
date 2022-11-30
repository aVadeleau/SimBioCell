tool
extends VisualScriptCustomNode

var _Preload = preload("res://SimBioCell/6-ExpertMode/Engine/RandomInt/Spt_RandomInt.gd") # Relative path
var _Script = _Preload.new()

func _get_caption():
	return "Random Integer"

func _get_category():
	return "SimCells"

func _step(inputs, outputs, start_mode, working_mem):

	outputs[0] = _Script.run(inputs[0],inputs[1])
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
	return 2
func _get_input_value_port_name(idx):
	match idx:
		0:
			return "int"
		1:
			return "int"

func _get_input_value_port_type(idx):
	match idx:
		0:
			return TYPE_INT
		1:
			return TYPE_INT

	
# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 1
func _get_output_value_port_name(idx):
	match idx:
		0:
			return "int"
	return "default"	
func _get_output_value_port_type(idx):
	match idx:
		0:
			return TYPE_INT



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
