extends "res://spawner/Spawner.gd"

const POLICE = preload("res://enemies/Police2.tscn") 

func _ready():
	instance_of = POLICE
	
func _process(delta):
	instance_of = POLICE