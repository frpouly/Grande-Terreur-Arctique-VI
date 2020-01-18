extends Area2D

const FISH = preload("res://Pickable.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _process(delta):
	

func empty():
	var fish = FISH.instance()
	fish.global_position = global_position;
	position += Vector2(0, 30)
	get_parent().add_child(fish)
	queue_free()

func _on_Bin_body_entered(body):
	print("entered")
	if(body.has_method("use")):
    	    body.usable=self

func _on_Bin_body_exited(body):
	if(body.has_method("use")):
    	    body.usable=null