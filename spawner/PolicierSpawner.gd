extends "res://spawner/Spawner.gd"

const POLICE = preload("res://enemies/Police1.gd") 


# Called when the node enters the scene tree for the first time.
func _ready():
	instance_of = POLICE
