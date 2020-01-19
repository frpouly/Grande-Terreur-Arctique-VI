extends Area2D

var speed = 10

var deadly = 5

var damage

func _process(delta):
    move(delta)
    removeWhenOffScreen()
	
func _ready():
	$Sound.play()

func move(delta): 
	#position = position + Vector2(cos(rotation_degrees), -sin(rotation_degrees)) * (50 * delta)
	#$CollisionShape2D.position=position
	deadly-=1
	position += speed * Vector2(1, 0).rotated(rotation)

func removeWhenOffScreen():
    if global_position.y < 0 or global_position.x < 0:
        queue_free()

func _on_Area2D_body_entered(body):
	if(deadly <=0 && body.has_method("hitted")):
		print("hitted")
		body.hitted(damage)