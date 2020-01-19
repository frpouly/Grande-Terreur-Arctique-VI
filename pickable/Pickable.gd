extends Area2D
class_name Pickable

var unpickable = false


func _on_Area2D_body_entered(body):
	if(body.has_method("pickup") && unpickable ):
		print("recup")
		body.pickup()
		queue_free()

func _on_Timer_timeout():
	unpickable = true
