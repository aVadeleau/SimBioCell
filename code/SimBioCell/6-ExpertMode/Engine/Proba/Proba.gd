tool
extends VisualScriptCustomNode

# The goal of this function is to calculate a probability between a given range and 1
# probability : A real, that is the first range of the probability 
# For example if probability is equal to 0.5 then the test of the probability will be between 0.5 and 1
# The function will return true if the probability is between the given range and 1
# It will return false if not
  
var _lifetime = preload("res://SimBioCell/6-ExpertMode/Engine/Proba/spt_proba.gd")
var lifetime = _lifetime.new()

func _get_caption():
	return "Proba"
	

func _get_category():
	return "SimCells"
	
	
func _step(inputs, outputs, start_mode, working_mem):
	outputs[0] = lifetime.run(inputs[0])
	return 0
	
	
func _has_input_sequence_port():
	return true
	
func _get_output_sequence_port_count():
	return 1
	
func _get_input_value_port_count():
	return 1 

func _get_input_value_port_name(idx):
	return "probability percent\n(0 <= x <= 100)"

func _get_input_value_port_type(idx):
	return TYPE_REAL

func _get_output_value_port_count():
	return 1
	
func _get_output_value_port_name(idx):
	return "result"

func _get_output_value_port_type(idx):
	return TYPE_BOOL
