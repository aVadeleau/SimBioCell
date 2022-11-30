tool
extends VisualScriptCustomNode

var _preload = preload("res://SimBioCell/6-ExpertMode/Engine/DetectionArea/Spt_DetectionArea.gd")
var _script = _preload.new()

func _get_caption():
	return "Detection Area"

func _get_category():
	return "SimCells"




# *****************************************************
# *   STEP    *
# *************
func _step(inputs, outputs, start_mode, working_mem):
	var res = _script.run(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4])
	outputs[0] = res[0]
	outputs[1] = res[1]
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
	return 5
func _get_input_value_port_name(idx):
	if idx == 0:
		return "Agent"
	elif idx == 1:
		return "Area name"
	elif idx == 2:
		return "From group"
	elif idx == 3:
		return "Group to detect"
	elif idx == 4:
		return "Detection scale"
	return "default"
func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	elif idx == 1:
		return TYPE_STRING
	elif idx == 2:
		return TYPE_STRING
	elif idx == 3:
		return TYPE_STRING
	elif idx == 4:
		return TYPE_REAL
	return TYPE_OBJECT

# *****************************************************
# *  OUTPUT   *
# *************
func _get_output_value_port_count():
	return 2
func _get_output_value_port_name(idx):
	if idx == 0:
		return "has detected"
	if idx == 1:
		return "object detected"
	return "default"	
func _get_output_value_port_type(idx):
	if idx == 0:
		return TYPE_BOOL
	if idx == 1:
		return TYPE_OBJECT
	return TYPE_OBJECT
