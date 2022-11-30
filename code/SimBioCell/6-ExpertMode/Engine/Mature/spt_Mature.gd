extends Node

##
# run
##
func run(agent : CollisionObject,
		group : String, 
		aging_factor : float):
	if agent.is_in_group(group) or group == "":
		if(agent.has_meta("age")):
			agent.set_meta("age", agent.get_meta("age") + aging_factor)
		else:
			agent.set_meta("age", 0)
		return 0
