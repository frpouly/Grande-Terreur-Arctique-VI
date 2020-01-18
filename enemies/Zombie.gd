extends KinematicBody2D

signal eaten

const WEAPON = preload("res://pickable/Weapon.tscn")
const MOVE_SPEED = 200

var weapon

onready var raycast = $RayCast2D

var player = null

func _ready():
	add_to_group("zombies")
	weapon = WEAPON.instance()
	add_child(weapon)
	

func _physics_process(delta):
	if player == null:
		return
	
	var vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll.name == "Player":
			coll.kill()

func eaten():
	emit_signal("eaten")
	queue_free()
	
func _process(delta):
    fire()

func fire():
	weapon.fire(global_rotation)

func set_player(p):
	player = p