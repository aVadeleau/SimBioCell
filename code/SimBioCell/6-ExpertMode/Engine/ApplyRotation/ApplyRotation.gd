tool
extends VisualScriptCustomNode

var _lifetime = preload("res://SimBioCell/6-ExpertMode/Engine/ApplyRotation/spt_applyRotation.gd")
var lifetime = _lifetime.new()

func _get_caption():
	return "ApplyRotation"
	

func _get_category():
	return "SimCells"
	
	
func _step(inputs, outputs, start_mode, working_mem):
	lifetime.run(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4])
	return 0
	
	
func _has_input_sequence_port():
	return true
	
func _get_output_sequence_port_count():
	return 1
	
func _get_input_value_port_count():
	return 5 

func _get_input_value_port_name(idx):
	var name
	
	match idx:
		0:
			name = "Agent"
		1:
			name = "Agent_group"
		2:
			name = "x_axis"
		3 :
			name = "y_axis"
		4:
			name = "z_axis"
			
	return name

func _get_input_value_port_type(idx):
	var type
	
	match idx:
		0: 
			type = TYPE_OBJECT
		1:
			type = TYPE_STRING
		2:
			type = TYPE_REAL
		3:
			type = TYPE_REAL
		4:
			type = TYPE_REAL

	return type


