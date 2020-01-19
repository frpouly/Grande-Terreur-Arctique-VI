extends KinematicBody2D

var pv = 300

signal eaten


const MOVE_SPEED = 10

var path : PoolVector2Array

var player = null

func _ready():
	add_to_group("zombies")
	#add_child(weapon)


func _physics_process(delta):
	if path.size() > 0:
		#print(path)
		var look_vec = player.position - global_position
		if(sqrt(look_vec.x*look_vec.x + look_vec.y*look_vec.y)<150):
			path.remove(0)
		else:	
			var move_vec = path[0] - position
			var velocity = move_vec.normalized() * MOVE_SPEED
		
#		printt(position.distance_to(path[0]), position.distance_to(path[0]) < 10)
			var collision = move_and_collide(velocity * delta)
			if collision:
				velocity = velocity.slide(collision.normal)
	
		# using move_and_slide
			velocity = move_and_slide(velocity)
	
		if (path.size() > 0 && position.distance_to(path[0]) < 1):
			print("remove")
			path.remove(0)

#func _physics_process(delta):
#	if player == null:
#		return
#
#	var vec_to_player = player.global_position - global_position
#	vec_to_player = vec_to_player.normalized()
#	var rotation = atan2(vec_to_player.y, vec_to_player.x)
#	move_and_collide(vec_to_player * MOVE_SPEED * delta)

	if (rotation < 3*PI/4 && rotation > -3*PI/4):
		if (rotation > PI/4):
			$AnimatedSprite.play("down")
		elif (rotation < -PI/4):
				$AnimatedSprite.play("up")
		else:
				$AnimatedSprite.play("right")

	else:
		$AnimatedSprite.play("left")
##	if(0.75<rotation && rotation>=-0.75):
##		$AnimatedSprite.play("left")
##	elif(-0.75<rotation && rotation>=-2.25):
##		$AnimatedSprite.play("right")
##	elif(rotation>0.75 && rotation<=2.25):
##		$AnimatedSprite.play("down")
##	else:
##		$AnimatedSprite.play("up")
#
#	#if raycast.is_colliding():
#		#var coll = raycast.get_collider()
#		#if coll.name == "Player":
#		#	coll.kill()

func hitted(var damage):
	pv -= damage
	if(pv <=0):
		queue_free()

func set_player(p):
	player = p