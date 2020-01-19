extends Control


onready var popup = get_node("PopupPanel")
onready var LifeBar = get_node("MarginContainer/VBoxContainer/Lifebar")
onready var HeatLevel = get_node("MarginContainer/VBoxContainer/HeatLevel")
onready var Hunger = get_node("MarginContainer/VBoxContainer/Hunger")


func _ready():
	pass


func _on_Player_hit(health):
	LifeBar.value=health


func _on_Zombie_eaten():
	$TextureProgress3.value+=1
	if($TextureProgress3.value==3):
		_on_Wanted()

func _on_Player_hunger(hunger):
	Hunger.value = hunger
#	print(hunger)


func _on_Player_eaten():
	Hunger.value+=20


func _on_Bin_trasher():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Bin Trasher \n Vous avez détruit une poubelle, jeune délinquant!"
	popup.popup()
	
func _on_Wanted():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Wanted \n Vous êtes plus poursuivi que la moulaga"
	popup.popup()