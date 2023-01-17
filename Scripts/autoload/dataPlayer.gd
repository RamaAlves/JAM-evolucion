extends Node

signal change_power

var poder_actual=""
var can_move = true


func setPoderActual(poder:String):
	poder_actual=poder
	print("seteado")
	emit_signal("change_power")
	
	
