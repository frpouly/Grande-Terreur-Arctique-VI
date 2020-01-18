extends KinematicBody2D
class_name Player

signal hit
signal hunger
signal eaten

const MOVE_SPEED = 300

var weapon = null
var health = 100
var hunger = 10000
onready var raycast = $RayCast2D

var TEMPO_WEAPON_CHANGE = 2.0
var weapon_changed = 0.0

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
	hunger-=1
	if(hunger%50==0):
		emit_signal("hunger")
	
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
	
	if Input.is_action_pressed("shoot"):
		fire()
	
	if Input.is_action_just_pressed("reload"):
		reload()
		
	if(weapon_changed < TEMPO_WEAPON_CHANGE):
		weapon_changed += delta

func kill():
	health-=10;
	emit_signal("hit",health)
	if(health<=0 || hunger<0):
		get_tree().reload_current_scene()
<<<<<<< HEAD
	

func pickup():
	emit_signal("eaten")
	print("Picked Up")
=======
>>>>>>> 1436be6956dab3806fac01f04c9446e4ff0f756c

func pickup_weapon(var w):
	if(weapon != null && weapon_changed > TEMPO_WEAPON_CHANGE):
		remove_child(weapon)
	weapon = w
	get_parent().remove_child(weapon)
	weapon.position = Vector2(0, 0)
	add_child(weapon)

func reload():
	if(weapon != null):
		weapon.reload()

func fire():
	if(weapon != null):
		weapon.fire()

    #var coll = bullet.get_collider()
    #if (coll.has_method("kill") and bullet.is_colliding()):
    #    coll.kill()