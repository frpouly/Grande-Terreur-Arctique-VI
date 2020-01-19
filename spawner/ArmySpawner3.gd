extends "res://spawner/Spawner.gd"

const ARMY = preload("res://enemies/Army3.tscn") 

func _ready():
	instance_of = ARMY
	
func _process(delta):
	instance_of = ARMY