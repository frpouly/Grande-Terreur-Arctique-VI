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
var used = false

var damage = 10


func _on_Area2D_body_entered(body):
	if(body.has_method("pickup_weapon")):
		body.pickup_weapon(self)
		used = true
		
		
func fire(rotation):
	if(reloading >= reload_time and nb_bullets_magazine > 0):
		var bullet = BULLET.instance(damage)
		bullet.damage = damage
		bullet.global_position = global_position
		bullet.global_rotation = rotation
		get_tree().get_root().add_child(bullet)
		reloading = 0
		nb_bullets_magazine = nb_bullets_magazine - 1
		return true
	return false


var missing_bullets	
func reload():
	if(nb_bullets_magazine < magazine_capacity):
		missing_bullets = magazine_capacity - nb_bullets_magazine
		if(missing_bullets < bullets_total):
			nb_bullets_magazine = magazine_capacity
			bullets_total -= missing_bullets
		else:
			nb_bullets_magazine += bullets_total
			bullets_total = 0
	else:
		pass
		#$clic.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	reloading += delta
	if(used):
		var m = get_global_mouse_position()
		rotation += get_angle_to(m)
