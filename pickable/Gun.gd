extends "res://pickable/Weapon.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_scale(Vector2(-1, 1))
	reload_time = 2
	bullets_total = 120
	nb_bullets_magazine = 12
	magazine_capacity = 12
	damage = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass