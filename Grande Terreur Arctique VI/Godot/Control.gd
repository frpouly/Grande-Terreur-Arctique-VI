extends Control



func _ready():
	$TextureProgress2.value=100

func _on_Player_hit(health):
	$TextureProgress2.value=health
