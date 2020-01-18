extends Area2D
class_name Pickable

func _on_Area2D_body_entered(body):
	if(body.has_method("pickup")):
		body.pickup()
		queue_free()