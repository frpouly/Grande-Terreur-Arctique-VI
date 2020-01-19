extends Area2D
class_name Bin

const FISH = preload("res://pickable/Pickable.tscn")

func empty():
	queue_free()

func _on_Bin_body_entered(body):
	print("entered")
	if(body.has_method("use")):
    	    body.usable=self

func _on_Bin_body_exited(body):
	if(body.has_method("use")):
    	    body.usable=null