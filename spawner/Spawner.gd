extends StaticBody2D

var instance_of

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn():
	var body = instance_of.instance()
	get_tree().get_root().add_child(body)
	body.global_position = global_position
	return body
