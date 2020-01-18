extends Control

func _ready():
	$TextureProgress2.value=100
	$TextureProgress3.value=0
	$TextureProgress4.value=100
	

func _on_Player_hit(health):
	$TextureProgress2.value=health


func _on_Zombie_eaten():
    $TextureProgress3.value+=1

func _on_Player_hunger():
	$TextureProgress4.value-=1

func _on_Player_eaten():
	$TextureProgress4.value+=20
