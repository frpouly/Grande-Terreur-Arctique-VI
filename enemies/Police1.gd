extends "res://enemies/Habitants.gd"

const WEAPON = preload("res://pickable/Gun.tscn")
var weapon


func _ready():
	player = get_node("../../Player")
	pv = 150
	weapon = WEAPON.instance()
	add_child(weapon)
	weapon.scale=(Vector2(0.5,0.5))
	
func _process(delta):
	var look_vec = player.position - global_position
	fire(look_vec)
	
func fire(look_vec):
	weapon.fire(atan2(look_vec.y,look_vec.x))
