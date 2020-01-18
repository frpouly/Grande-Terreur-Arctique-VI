extends Node2D

onready var Zombies = get_node("Zombies")


func _ready():
	for zomb in Zombies.get_children():
		zomb.connect("eaten", $Control, "_on_Zombie_eaten")
