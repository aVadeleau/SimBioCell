tool extends Spatial

export(bool) var active = true
export(bool) var zone_spawner = true setget set_type
export(Vector3) var zone_size = Vector3.ONE setget zone_scale
export(Resource) var source_object
export(NodePath) var spawned_parent
export(int) var instances_to_spawn = 1
export(bool) var random_rotation = false
export(bool) var random_scale = false
export(Vector2) var scale_range = Vector2(0.5, 1.5)
export(float) var interval_seconds = 1.0
export(String) var shortcut 

onready var Point = get_child(0)
onready var Zone = get_child(1)
onready var _timer = Timer.new()
onready var new_parent = get_node(spawned_parent)

func _ready():
	if not Engine.editor_hint:
		Zone.set_visible(false)
		Point.set_visible(false)
		
		if interval_seconds > 0:
			add_child(_timer)
			_timer.connect("timeout", self, "spawn")
			_timer.set_wait_time(interval_seconds)
			_timer.set_one_shot(false)
			_timer.start()
		else:
			spawn()
			

func _process(_delta):
	if Point == null:
		Point = get_child(0)
	if Zone == null:
		Zone = get_child(1)
	if not Engine.editor_hint:
		if not active && not _timer.is_stopped():
			_timer.stop()
		if active && _timer.is_stopped() && interval_seconds > 0:
			_timer.start()


func _unhandled_key_input(event):
	if shortcut != null:
		if (event.as_text() == shortcut):
			spawn()

func spawn():
	if source_object != null:
		for _i in range(instances_to_spawn):
			var node = source_object.instance()
			if random_rotation:
				node.set_rotation(Vector3(randf(), randf(), randf()))
			if random_scale:
				node.set_scale(Vector3.ONE * rand_range(scale_range.x, scale_range.y))
			if zone_size:
				node.set_translation(Vector3(rand_range(-zone_size.x/2, zone_size.x/2), rand_range(-zone_size.y/2, zone_size.y/2), rand_range(-zone_size.z/2, zone_size.z/2)))
			if spawned_parent != null:
				new_parent.add_child(node)
			else:
				add_child(node)

func set_type(value):
	Point.set_visible(!value)
	Zone.set_visible(value)
	zone_spawner = value

func zone_scale(value):
	Zone=get_child(1)
	Zone.scale = value
	zone_size = value
