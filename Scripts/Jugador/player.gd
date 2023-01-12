extends CharacterBody2D

@export var vel= Vector2(0,5.0)

const penalizacion= 0.9
const bonus= 1.1

var mov=Vector2.ZERO
var izq=false
var puede_saltear=""

func _physics_process(_delta):
	mov.x= direction_input().x
	mov.y= -vel.y
	move_and_collide(mov)

#-----------------> Funciones player
func direction_input() -> Vector2:
	var dir= Vector2.ZERO
	if DataPlayer.can_move:
		dir = dir_input(dir)
		if dir.x < 0:
			pass
			#carpincho_sprite.flip_h = true
			#animation.play("walk_side")
		elif dir.x > 0:
			pass
			#carpincho_sprite.flip_h = false
			#animation.play("walk_side")
	return dir

func dir_input(direction:Vector2) -> Vector2:
	if Input.is_action_just_pressed("ui_left"):
		if !izq:
			direction.x = -500
			izq=true
		#$soundWalk.play()
		#t_standby.start()
		#sprite_sit = false
	elif Input.is_action_just_pressed("ui_right"):
		if izq:
			direction.x = 500
			izq=false
		#$soundWalk.play()
		#t_standby.start()
		#sprite_sit = false
	return direction

func aplicarEvolucion(evolucion:String):
	match evolucion:
		"pajaro":
			#el player se transforma
			setPajaro()
			pass

		"pinguino":
			setPinguino()

		"cocodrilo":
			#el player se transforma
			setCocodrilo()
			pass
		"jirafa":
			#el player se transforma
			setJirafa()
			pass
		"rino":
			#el player se transforma
			setRino()
			pass
		"canguro":
			setCanguro()
			#el player se transforma
			pass
		_:
			pass

func obstaculoGolpeado(obstaculo:String):
	if obstaculo==puede_saltear:
		vel.y = (vel.y * bonus)
	else:
		vel.y = (vel.y * penalizacion)

#-----------------> Seteo de evoluciones
#["base","rio_lava","lago_congelado","pasto_alto","agua","muro","valla"]

func setPajaro():
	puede_saltear="rio_lava"
	pass

func setPinguino():
	puede_saltear="lago_congelado"

func setCocodrilo():
	puede_saltear="agua"
	pass

func setJirafa():
	puede_saltear="pasto_alto"
	pass

func setRino():
	puede_saltear="muro"
	pass

func setCanguro():
	puede_saltear="valla"
	pass
