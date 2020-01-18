extends Control


onready var popup = get_node("PopupPanel")

func _ready():
	$TextureProgress2.value=100
	$TextureProgress3.value=0
	$TextureProgress4.value=100
	


func _on_Player_hit(health):
	$TextureProgress2.value=health


func _on_Zombie_eaten():
	$TextureProgress3.value+=1
	if($TextureProgress3.value==3):
		_on_Wanted()

func _on_Player_hunger():
	$TextureProgress4.value-=1


func _on_Player_eaten():
	$TextureProgress4.value+=20


func _on_Bin_trasher():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Bin Trasher \n Vous avez détruit une poubelle, jeune délinquant!"
	popup.popup()
	
func _on_Wanted():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Wanted \n Vous êtes plus poursuivi que la moulaga"
	popup.popup()