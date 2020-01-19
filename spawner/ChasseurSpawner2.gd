extends "res://spawner/Spawner.gd"

const CHASSEUR = preload("res://enemies/Chasseur2.tscn") 

func _ready():
	instance_of = CHASSEUR
	
func _process(delta):
	instance_of = CHASSEUR