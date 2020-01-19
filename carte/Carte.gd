extends Node2D

onready var popup = get_node("Spawns/PolicierSpawn")
const FISH = preload("res://pickable/Pickable.tscn")
onready var Spawners = get_node("Spawns")
onready var Enemies = get_node("Enemies")
onready var Nav2d : Navigation2D = get_node("Navigation2D")
onready var Bin = get_node("pickups/Bin")

func _ready():
	for s in Spawners.get_children():
		s.spawn(Enemies)
	
	for e in Enemies.get_children():
		e.path = Nav2d.get_simple_path(e.position, $Player.position)

func _process(delta):
	for s in Spawners.get_children():
		s.spawn(Enemies)
	for e in Enemies.get_children():
		if(e.path.size()==0):
			e.path = Nav2d.get_simple_path(e.position, $Player.position)

	
func _on_bin_trasher(g_pos : Vector2):
	var f = FISH.instance()
	f.global_position = g_pos
	$pickups.add_child(f)