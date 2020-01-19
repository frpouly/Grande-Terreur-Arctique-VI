extends StaticBody2D

var instance_of

const MAX_INSTANCES = 3
var instances = 0

var cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn(container):
	cooldown-=1
	if(cooldown <= 0 && instances<MAX_INSTANCES):
		cooldown = 1000
		instances+=1
		var body = instance_of.instance()
		container.add_child(body)
		body.global_position = global_position
		return body
