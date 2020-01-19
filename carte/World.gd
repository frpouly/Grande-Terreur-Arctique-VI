extends Node2D

onready var Mechants = get_node("Mechants")

func _ready():
	for zomb in Mechants.get_children():
		zomb.connect("eaten", $Control, "_on_Zombie_eaten")
