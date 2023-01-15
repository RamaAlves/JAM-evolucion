extends Area2D

#----------------->Variables globales
@export var tipoItem = 0

#------------------> Variables locales
var tipos =["hielo","piedra","agua","fuego"]

#-------------------> Variables onready
@onready var sprites= $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	obtenerPoder(tipos[tipoItem])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#--------------------> Funciones propias
func obtenerPoder(poder:String):
	var img ="res://Resource/Items/frasco"+str(tipoItem)+"-1.png"
	sprites.texture=load(img)
	match poder:
		"hielo":
			pass
		"piedra":
			pass
		"agua":
			pass
		"fuego":
			pass
		_:
			pass


func _on_body_entered(body):
	body.aplicarEvolucion(tipos[tipoItem])
	$AnimationPlayer.play("Consume")
	
