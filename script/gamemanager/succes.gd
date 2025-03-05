extends Node

#finir monde 1
var succes_1 = false
#tué un vero
var succes_2 = false
#debloqué le niv bonus
var succes_3 = false

var nouv_succes = false

func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	pass

func debloquage_succes(nombre_succes):
	#succes 1
	if nombre_succes == 1:
		succes_1 = true
		nouv_succes = true
	#succes 2
	if nombre_succes == 2:
		succes_2 = true
		nouv_succes = true
