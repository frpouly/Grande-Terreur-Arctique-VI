extends Node2D

onready var popup = get_node("Spawns/PolicierSpawn")
const FISH = preload("res://pickable/Pickable.tscn")

func _ready():
	for n in $pickups.get_children():
		pass
		if n is Bin:
			n.connect("trasher", self, "_on_bin_trasher")

func _process(delta):
	pass
	#popup.spawn()

	
func _on_bin_trasher(g_pos : Vector2):
	var f = FISH.instance()
	f.global_position = g_pos
	$pickups.add_child(f)