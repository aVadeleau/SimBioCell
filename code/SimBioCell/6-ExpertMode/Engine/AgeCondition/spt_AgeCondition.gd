extends Node

##
# run
##
func run(agent : CollisionObject,
		group : String,
		comp : String, 
		age_trigger : float):

	if agent.is_in_group(group):
		if(agent.get_meta("age") != null):
			match comp:
				"<":
					if agent.get_meta("age") < age_trigger:
						return true
				">":
					if agent.get_meta("age") > age_trigger:
						return true
				"==":
					if agent.get_meta("age") == age_trigger:
						return true
				">=":
					if agent.get_meta("age") >= age_trigger:
						return true
				"<=":
					if agent.get_meta("age") <= age_trigger:
						return true
				"!=":
					if agent.get_meta("age") != age_trigger:
						return true
	return false
