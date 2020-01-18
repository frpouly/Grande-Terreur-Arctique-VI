extends "res://pickable/Weapon.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	reload_time = 0.1
	bullets_total = 210
	nb_bullets_magazine = 30
	magazine_capacity = 30

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

