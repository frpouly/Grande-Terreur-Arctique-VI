extends "res://Pickable.gd"

const BULLET = preload("res://Bullet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const RELOAD_TIME = 0.5
var reloading = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if(body.has_method("pickup_weapon")):
		body.pickup_weapon(self)
		get_parent().remove_child(self)
		body.add_child(self)
		position = Vector2(0, 0)
		
		
func fire():
	if(reloading >= RELOAD_TIME):
		var bullet = BULLET.instance()
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation
		get_parent().get_parent().add_child(bullet)
		reloading = 0

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	reloading += delta

func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	pass # Replace with function body.
