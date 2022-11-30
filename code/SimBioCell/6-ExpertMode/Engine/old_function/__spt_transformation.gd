extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func run(agent : Object, transformed : String, transformer : String, objToCreate : String, probability : int, deleteTransformer : bool, deleteTransformed : bool):
	var made:bool 	= false
	var bodies = agent.get_colliding_bodies()
	if bodies.size() > 0:
		if agent.is_in_group(transformed):
			for b in bodies:
				
				if b.is_in_group(transformer):
					var random_number = randi()%probability
					if(random_number==0):
						#print("create : ",objToCreate)
						var newObject
						newObject = load(str("res://SimBioCell/2-PreFabAgents/",objToCreate,".tscn")).instance()
						newObject.translate(b.translation)
						if(deleteTransformer):
							b.queue_free()
						if(deleteTransformed):
							agent.queue_free()
						b.get_parent().get_parent().get_child(0).add_child(newObject)
						made = true
	return made
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
