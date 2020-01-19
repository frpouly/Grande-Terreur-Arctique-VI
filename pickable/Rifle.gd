extends "res://pickable/Weapon.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_scale(Vector2(-1, 1))
	reload_time = 3
	bullets_total = 100
	nb_bullets_magazine = 8
	magazine_capacity = 8
	damage = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
