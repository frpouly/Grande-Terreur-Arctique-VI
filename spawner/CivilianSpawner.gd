extends "res://spawner/Spawner.gd"


var PNJ = preload("res://civils/1.tscn")

func _ready():
	instance_of = PNJ
	
func _process(delta):
	instance_of = PNJ