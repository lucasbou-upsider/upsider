extends Node

#nombre de platforme restant
var platforme = 3
#nombre de piece
var piece = 0
#nombre de piece déposé dans la boite
var piece_depose = 0
var piece_bonus_depose = 0
#compteur de mort
var mort = 0
var mort_vero = 0
#pause
var paused = false
#respawn
var derniere_piece = 0
#victoire
var menue_victoire = false
#capacité
var mode_capacite = false


#1 = player de base 2 = player nerd 3 = sylvan tp
var skin_player = 1

#player débloqué
var skin_nerd_debloque = false
var skin_debloquer: Array = [1]

#capacité tp position
var tp_position = 0
var tp_pose = false
var dans_area_reprendre_tp = false

#mode speedrun
var mode_speedrun = false
var timer_speedrun = 0
var temps_monde_1 = 0

#niv fini
var niv_fini: Array

var player_mort = false

#etoil nouv skin debloqué
var nouv_skin = false
var nouv_skin_animation = false


#niv bonus débloqué
var niv_bonus_1_debloque = false

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	#débloqué skin nerd
	if mort >= 20:
		skin_nerd_debloque = true
		nouv_skin = true
	
	#limite skin du joueur
	if skin_player == 0:
		skin_player = 1
	if skin_player == 2 and skin_nerd_debloque == false:
		skin_player = 1
	if skin_player == 4:
		skin_player = 3


func debloque(debloque_niv):
	if debloque_niv == 1.1:
		niv_bonus_1_debloque = true
		
