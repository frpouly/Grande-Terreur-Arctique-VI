extends "res://pickable/Pickable.gd"

const BULLET = preload("res://bullet/Bullet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var reload_time = 2.0
var reloading = 0
var magazine_capacity = 12
var nb_bullets_magazine = 12
var bullets_total = 120


func _on_Area2D_body_entered(body):
	if(body.has_method("pickup_weapon")):
		body.pickup_weapon(self)
		
		
func fire():
	if(reloading >= reload_time and nb_bullets_magazine > 0):
		var bullet = BULLET.instance()
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation
		get_parent().get_parent().add_child(bullet)
		reloading = 0
		nb_bullets_magazine = nb_bullets_magazine - 1
	
func reload():
	if(bullets_total < magazine_capacity):
		nb_bullets_magazine = bullets_total
	else:
		nb_bullets_magazine += magazine_capacity
	bullets_total -= nb_bullets_magazine
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	reloading += delta

func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	pass # Replace with function body.
