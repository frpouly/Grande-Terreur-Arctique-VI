extends Control


onready var popup = get_node("PopupPanel")
onready var LifeBar = get_node("Lifebar")
onready var HeatLevel = get_node("HeatLevel")
onready var Hunger = get_node("Hunger")
onready var Bullets = get_node("Bullets")
onready var timer = $PopupPanel/Timer

func _on_Player_hit(health):
	print("aie")
	LifeBar.value=health

func _on_Zombie_eaten():
	$TextureProgress3.value+=1
	if($TextureProgress3.value==3):
		_on_Wanted()

func _on_Player_hunger(hunger):
	Hunger.value = hunger


func _on_Player_eaten():
	Hunger.value+=20

func _ready():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Welcome to Ingluriuzz \n Stop au réchauffement climatique!"
	popup.popup()
	timer.start()
	

func _on_Bin_trasher():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Bin Trasher \n Vous avez détruit une poubelle, jeune délinquant!"
	popup.popup()
	timer.start()
	
func _on_Wanted():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Wanted \n Vous êtes plus poursuivi que la moulaga"
	popup.popup()
	timer.start()

func _on_hunger():
	var text = $PopupPanel/Label
	text.text = "Achievement Get ! \n Au regime! \n Vous avez plus la dalle que Guilby avant un Gaosheng"
	popup.popup()
	timer.start()

func _on_Timer_timeout():
	popup.hide()

func _on_Bullet_Changed(magazine, total):
	Bullets.text = str(magazine) + "/" + str(total)