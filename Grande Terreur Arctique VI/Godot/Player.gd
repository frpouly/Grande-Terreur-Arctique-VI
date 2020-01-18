extends KinematicBody2D
class_name Player

signal hit

const MOVE_SPEED = 300

var weapon = null
var health = 100
onready var raycast = $RayCast2D

func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)
	

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
	
	if Input.is_action_pressed("shoot"):
		fire();
		#var coll = raycast.get_collider()
		#if raycast.is_colliding() and coll.has_method("kill"):
		#if raycast.is_colliding() and coll.has_method("kill"):
		#	coll.kill()

func kill():
	health-=10;
	emit_signal("hit",health)
	if(health<0):
		get_tree().reload_current_scene()
	

func pickup():
	print("Picked Up")

func pickup_weapon(var w):
	weapon = w

func fire():
	if(weapon != null):
		weapon.fire()

    #var coll = bullet.get_collider()
    #if (coll.has_method("kill") and bullet.is_colliding()):
    #    coll.kill()