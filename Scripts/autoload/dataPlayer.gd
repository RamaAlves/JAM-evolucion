extends Node

signal change_power
signal activar_evolucion

var poder_actual=""
var can_move = true

func activarEvolucion():
	emit_signal("activar_evolucion")

func setPoderActual(poder:String):
	poder_actual=poder
	print("seteado")
	emit_signal("change_power")
	
	
