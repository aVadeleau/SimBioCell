tool
extends Spatial

export var bo : bool = false setget red

func _ready():
	red(false)

func red(val):
	print(get_parent().get_parent().get_node("Agents"))
