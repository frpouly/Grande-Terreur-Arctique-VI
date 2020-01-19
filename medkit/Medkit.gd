extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pv = 50

func _on_Area2D_body_entered(body):
	if body.has_method("heal"):
		body.heal(pv)
		queue_free()