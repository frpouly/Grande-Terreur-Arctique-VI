extends KinematicBody2D

var path : PoolVector2Array
var velocity := Vector2()

const speed := 100

func _process(delta):
	if (path.size() > 0):
		
		velocity = speed * (path[0]-position).normalized()
		
		var collision := move_and_collide(velocity * delta)
		if collision:
			velocity = velocity.slide(collision.normal)
		
		velocity = move_and_slide(velocity)
		
		if (position.distance_to(path[0]) < 1):
			path.remove(0)
