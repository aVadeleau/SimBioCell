extends Node


func run(probability : float):
	var result = false
	var prob = stepify(rand_range(0, 100), 0.01)
	if prob <= probability:
			result = true
	return result
