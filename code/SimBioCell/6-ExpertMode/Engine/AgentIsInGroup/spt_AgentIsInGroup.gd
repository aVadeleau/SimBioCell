extends Node

##
# run
##
func run(agent : CollisionObject,
		group : String):
	if agent.is_in_group(group):
		return true
	return false
