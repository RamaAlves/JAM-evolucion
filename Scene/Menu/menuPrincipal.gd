extends Control

@export var level_1= ""

@onready var street= $ParallaxBackground2/ParallaxLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#DatosPlayer.reset() #reiniciar stats del player
	#GlobalMusic.menu() #reproducir musica del menu
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	street.motion_offset.y += 1


#func _on_BotonMenu_pressed():
	#GlobalMusic.game()
# warning-ignore:return_value_discarded
	#get_tree().change_scene(nivel_1)


func _on_button_jugar_pressed():
	#GlobalMusic.game() #Reproducir musica juego
	# warning-ignore:return_value_discarded
	get_tree().change_scene(nivel_1)
