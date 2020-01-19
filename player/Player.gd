extends KinematicBody2D
class_name Player

signal hit
signal hunger
signal bullets_changed

export var MOVE_SPEED = 100
export var max_hunger = 50

var weapon = null
var health = 500
var hunger = max_hunger
var usable = null

var TEMPO_WEAPON_CHANGE = 2.0
var weapon_changed = 0.0

onready var HungerTimer : Timer = get_node("HungerTimer")

func _ready():
	connect("hit", get_node("CanvasLayer/Ui"), "_on_Player_hit")
	connect("hunger", get_node("CanvasLayer/Ui"), "_on_Player_hunger")
	connect("bullets_changed", get_node("CanvasLayer/Ui"), "_on_Bullet_Changed");
	
	HungerTimer.connect("timeout", self, "_on_HungerTimer_timeout")
	
	emit_signal("hit",health)
	emit_signal("hunger", hunger)
	
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)



func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		$AnimatedSprite.play("up")
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite.play("down")
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite.play("left")
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite.play("right")
		move_vec.x += 1
	
	
	var velocity = move_vec.normalized() * MOVE_SPEED
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
	
	# using move_and_slide
	velocity = move_and_slide(velocity)
	

	if Input.is_action_pressed("shoot"):
		fire()
		
	if Input.is_action_pressed("use"):
		use()
	
	if Input.is_action_just_pressed("reload"):
		if weapon != null:
			reload()
			emit_signal("bullets_changed", weapon.nb_bullets_magazine, weapon.bullets_total)
		
	if(weapon_changed < TEMPO_WEAPON_CHANGE):
		weapon_changed += delta

func kill():
	get_tree().reload_current_scene()
	
func hitted(var damage):
	health -= damage
	emit_signal("hit", health)
	if(health <=0):
		kill()

func pickup():
	hunger += 300
	if hunger > max_hunger:
		hunger = max_hunger
	
	emit_signal("hunger", hunger)
		
	print("Picked Up")

func pickup_weapon(var w):
	if(weapon != null && weapon_changed > TEMPO_WEAPON_CHANGE):
		remove_child(weapon)
	weapon = w
	weapon.get_parent().remove_child(weapon)
	weapon.position = Vector2(0, 0)
	emit_signal("bullets_changed",  weapon.nb_bullets_magazine, weapon.bullets_total)
	add_child(weapon)

func reload():
	if(weapon != null):
		weapon.reload()
		emit_signal("bullets_changed", weapon.nb_bullets_magazine, weapon.bullets_total)

func fire():
	if(weapon != null):
		var look_vec = get_global_mouse_position() - global_position
		weapon.fire(atan2(look_vec.y, look_vec.x))
		emit_signal("bullets_changed", weapon.nb_bullets_magazine, weapon.bullets_total)
		
func use():
	if(usable != null):
		usable.empty()
		usable = null

    #var coll = bullet.get_collider()
    #if (coll.has_method("kill") and bullet.is_colliding()):
    #    coll.kill()


func _on_Bin_body_entered(body):
	if(body.has_method("use")):
    	    body.usable=self

func _on_Bin_body_exited(body):
	if(body.has_method("use")):
    	    body.usable=null


func _on_Police1_eaten():
	pass # Replace with function body.

func _on_HungerTimer_timeout():
	hunger -= 1
	emit_signal("hunger", hunger)
	
	if hunger <= 0:
		kill()

func eat(habitant):
	hunger = max_hunger
	habitant.queue_free()