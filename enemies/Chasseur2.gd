extends "res://enemies/Habitants.gd"

const WEAPON = preload("res://pickable/Rifle.tscn")
var weapon


func _ready():
	player = get_node("../../Player")
	pv = 150
	weapon = WEAPON.instance()
	add_child(weapon)
	weapon.scale=(Vector2(0.5,0.5))
	
func _process(delta):
	var look_vec = player.position - global_position
	if player.get_global_position().distance_to(global_position) < 300:
		fire(look_vec)
	
func fire(look_vec):
	if ! weapon.fire(atan2(look_vec.y,look_vec.x)):
		weapon.reload()
