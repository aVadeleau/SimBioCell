tool
extends VisualScriptCustomNode

# The goal of this function is to push an object by an impulse by one or more of its axis
# This function takes four parameters : 
# Agent : the first parameter, it the object you want to push
# x_axis : the second parameter, the power of the impulse
# y_axis : the third parameter, the power of the impulse
# z_axis : the fourth parameter, the power of the impulse

var _lifetime = preload("res://SimBioCell/6-ExpertMode/Engine/ApplyForceImpulse/spt_applyForceImpulse.gd")
var lifetime = _lifetime.new()

func _get_caption():
	return "ApplyForceImpulse"
	

func _get_category():
	return "SimCells"
	
	
func _step(inputs, outputs, start_mode, working_mem):
	lifetime.run(inputs[0], inputs[1], inputs[2], inputs[3])
	return 0
	
	
func _has_input_sequence_port():
	return true
	
func _get_output_sequence_port_count():
	return 1
	
func _get_input_value_port_count():
	return 4 

func _get_input_value_port_name(idx):
	var name
	
	match idx:
		0:
			name = "Agent"
		1:
			name = "x_axis"
		2:
			name = "y_axis"
		3 :
			name = "z_axis"
			
	return name

func _get_input_value_port_type(idx):
	var type
	
	if (idx == 0):
		type = TYPE_OBJECT	
	else:
		type = TYPE_REAL
		
	return type


