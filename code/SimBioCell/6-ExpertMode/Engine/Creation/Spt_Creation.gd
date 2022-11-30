extends Node

func run(agent :Object, position :Vector3,path : Node):
	var newAgent
	print(agent.get_path())
	newAgent = load(agent.get_path()).instance()
	newAgent.translate(position)
	path.add_child(newAgent)
	return(newAgent)

