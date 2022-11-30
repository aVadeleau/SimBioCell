extends Area
export (NodePath) var other_portal
onready var node = get_node(other_portal)
export var lockAxis : String = "x"
export var entry : bool = true

var axis : int

# Called when the node enters the scene tree for the first time.
func _ready():
	match lockAxis:
		"x": 
			axis = 0
		"y":
			axis = 1
		"z": 
			axis = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Portal_body_entered(body):
	#print(body.name)
	if(entry):
		if(body.is_in_group("Cell")):
			
			#var b : RigidBody = body
			match lockAxis:
				"x" :
					#print("before translate : ",body.translation)
					#body.get_child(0).global_translate(Vector3(node.translation[axis],body.get_child(0).translation[1],body.get_child(0).translation[2]))
					#body.get_child(1).global_translate(Vector3(node.translation[axis],body.get_child(1).translation[1],body.get_child(1).translation[2]))
					#body.get_child(0).transform.origin.x = node.translation[axis]
					#body.get_child(1).transform.origin.x = node.translation[axis]
					#var coord = body.get_global_transform()
					#coord.origin.x = node.translation[axis]
					#body.set_global_transform(coord)

					#b.translate(Vector3(-100,0,0))
					#print("after translate : ",body.translation)
					body.reset = true
					body.init_x = node.translation[0]+1
				"y" :
					body.translate(Vector3(body.translation[0],node.translation[axis],body.translation[2]))
				"z" :
					body.translate(Vector3(body.translation[0],body.translation[1],node.translation[axis]))
			body.add_central_force(Vector3.ZERO)
