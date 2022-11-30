extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func run(agent : Object, group : String, objToCreate : String, condition : bool):
	if agent.is_in_group(group):
		if condition == true :
			var newAgent
			newAgent = load(str("res://SimBioCell/2-PreFabAgents/",objToCreate,".tscn")).instance()
			newAgent.translate(agent.translation)
			agent.get_parent().add_child(newAgent)
			agent.queue_free()
			return newAgent
	return agent
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
