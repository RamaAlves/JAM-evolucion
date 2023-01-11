extends Area2D

#----------------->Variables globales
@export var tipoItem = 0

#------------------> Variables locales
var tipos =["pajaro","cocodrilo","jirafa","rino","canguro"]

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
	match poder:
		"pajaro":
			var img ="res://Resource/pw_0"+str(tipoItem)+".png"
			sprites.texture=load(img)
			pass
		"cocodrilo":
			var img ="res://Resource/pw_0"+str(tipoItem)+".png"
			sprites.texture=load(img)
			pass
		"jirafa":
			var img ="res://Resource/pw_0"+str(tipoItem)+".png"
			sprites.texture=load(img)
			pass
		"rino":
			var img ="res://Resource/pw_0"+str(tipoItem)+".png"
			sprites.texture=load(img)
			pass
		"canguro":
			var img ="res://Resource/pw_0"+str(tipoItem)+".png"
			sprites.texture=load(img)
			pass
		_:
			pass


func _on_body_entered(body):
	body.aplicarEvolucion(tipos[tipoItem]);
	pass # Replace with function body.
