extends Control

@onready var sprite= $EvoContainer/VBoxContainer/Sprite2D
@onready var evoTexto = $EvoContainer/VBoxContainer/evoText
@onready var animationManager= $EvoContainer/VBoxContainer/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.scale=Vector2(0,0)
	evoTexto.text=""
	DataPlayer.change_power.connect(activarPoder)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activarPoder():
	print("activado")
	animationManager.play("aparecer")
	evoTexto.text= DataPlayer.poder_actual


func _on_animation_player_animation_finished(anim_name):
	if anim_name=="aparecer":
		animationManager.play("idle")
