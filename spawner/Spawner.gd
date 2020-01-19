extends StaticBody2D

var instance_of

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn(container):
	var body = instance_of.instance()
	container.add_child(body)
	body.global_position = global_position
	return body
