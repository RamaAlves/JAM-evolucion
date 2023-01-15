extends CharacterBody2D

@export var vel= Vector2(0,5.0)

const penalizacion= 0.9
const bonus= 1.1

var mov=Vector2.ZERO
var izq=false
var poder_activado=false
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
	elif Input.is_action_just_pressed("ui_accept"):
		activarPoder()

	return direction

func aplicarEvolucion(evolucion:String):
	match evolucion:
		"Hielo":
			#el player se transforma
			setHielo()
			pass

		"piedra":
			setPiedra()

		"agua":
			#el player se transforma
			setAgua()
			pass
		"fuego":
			#el player se transforma
			setFuego()
			pass
		_:
			pass

func activarPoder():
	poder_activado=true
	await get_tree().create_timer(4).timeout
			#sptite del poder
	puede_saltear=""


func obstaculoGolpeado(obstaculo:String):
	if (obstaculo==puede_saltear) && poder_activado:
		vel.y = (vel.y * bonus)
	else:
		vel.y = (vel.y * penalizacion)

#-----------------> Seteo de evoluciones
#["hielo","piedra","agua","fuego"]
#["base","rio_lava","lago_congelado","agua","muro"]

func setHielo():
	puede_saltear="lago_congelado"
	pass

func setPiedra():
	puede_saltear="muro"

func setAgua():
	puede_saltear="agua"
	pass

func setFuego():
	puede_saltear="rio_lava"
	pass


