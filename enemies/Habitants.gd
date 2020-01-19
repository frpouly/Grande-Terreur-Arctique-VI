extends KinematicBody2D

var pv = 100

signal eaten

const WEAPON = preload("res://pickable/Weapon.tscn")
const MOVE_SPEED = 200

var weapon

var player = null

func _ready():
	add_to_group("zombies")
	weapon = WEAPON.instance()
	#add_child(weapon)
	

func _physics_process(delta):
	if player == null:
		return
	
	var vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	var rotation = atan2(vec_to_player.y, vec_to_player.x)
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	print(rotation)
	if (rotation < 3*PI/4 && rotation > -3*PI/4):
		if (rotation > PI/4):
			$AnimatedSprite.play("down")
		elif (rotation < -PI/4):
				$AnimatedSprite.play("up")
		else:
				$AnimatedSprite.play("right")
	
	else:
		$AnimatedSprite.play("left")
#	if(0.75<rotation && rotation>=-0.75):
#		$AnimatedSprite.play("left")
#	elif(-0.75<rotation && rotation>=-2.25):
#		$AnimatedSprite.play("right")
#	elif(rotation>0.75 && rotation<=2.25):
#		$AnimatedSprite.play("down")
#	else:
#		$AnimatedSprite.play("up")

	#if raycast.is_colliding():
		#var coll = raycast.get_collider()
		#if coll.name == "Player":
		#	coll.kill()

func hitted(var damage):
	pv -= damage
	if(pv <=0):
		queue_free()
	
func _process(delta):
    fire()

func fire():
	weapon.fire(global_rotation)

func set_player(p):
	player = p