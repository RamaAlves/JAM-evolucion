extends Area2D

@export var tipo=0

var tipo_obstaculo=["base","rio_lava","lago_congelado","agua","muro"]

# Called when the node enters the scene tree for the first time.
func _ready():
	getObstaculo(tipo_obstaculo[tipo])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


#---------> Funcion de obstaculos
func getObstaculo(obstaculo:String):
	match obstaculo:
		"base":
			pass
		"rio_lava":
			pass
		"lago_congelado":
			pass
		"agua":
			pass
		"muro":
			pass
		_:
			pass


func _on_body_entered(body):
	$CollisionShape2D.set_deferred("disabled",true);
	
	if !(tipo_obstaculo[tipo]=="base"):
		body.obstaculoGolpeado(tipo_obstaculo[tipo])
	
	destroyObstaculo()

func destroyObstaculo():
	await get_tree().create_timer(4).timeout
	queue_free()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
