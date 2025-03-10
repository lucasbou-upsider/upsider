extends AnimatedSprite2D

@onready var description_skin: Label = $"../description_skin"
@onready var etoile_skin: AnimatedSprite2D = $"../étoile_skin"
@onready var menu_2: Control = $"../.."
@onready var box_container: BoxContainer = $"../BoxContainer"


var marche = true
var dernier_player_debloquer 
var limite_player_debloquer 
var player2 = false
var player3 = false

func _ready() -> void:
	if GameManager.skin_debloquer.size() == 1:
		box_container.visible = false
		description_skin.visible = false
	
	
	if GameManager.skin_debloquer.has(2):
		player2 = true
	if GameManager.skin_debloquer.has(3):
		player3 = true
	print(player2)
	print(player3)


	GameManager.skin_debloquer.sort()#trie le tableau des player
	print(GameManager.skin_debloquer)
	limite_player_debloquer = GameManager.skin_debloquer.back() + 1
	dernier_player_debloquer = GameManager.skin_debloquer.back()
	
	if GameManager.nouv_skin == true:
		etoile_skin.visible = true


func _process(_delta: float) -> void:
	if marche == false:
		if GameManager.skin_player == 1:
			play("player_base")
			description_skin.text = "le skin de base de tous les joueurs"
		if GameManager.skin_player == 2:
			description_skin.text = "skin assiste permettant que les plateformes durent plus longtemps"
			play("player_nerd")
		if GameManager.skin_player == 3:
			description_skin.text = "skin ayant le pouvoir de se teleporter"
			play("player_sylvan")
		if GameManager.skin_player == 4:
			description_skin.text = "skin allant beaucoup trop vite"
			play("player_meven")

	#afficher l'etoile
	if GameManager.skin_player == 2:
		etoile_skin.visible = false

	#animation
	if marche == true:
		if GameManager.skin_player == 4:
			position.x += 3
		else:
			position.x += 2
		if GameManager.skin_player == 1:
			play("marche_base")
		if GameManager.skin_player == 2:
			play("marche_nerd")
		if GameManager.skin_player == 3:
			play("marche_sylvan")
		if GameManager.skin_player == 4:
			play("marche_meven") 



func _on_button_2_pressed() -> void:
	GameManager.skin_player += 1
	if GameManager.skin_player == limite_player_debloquer:
		GameManager.skin_player = 1
	if GameManager.skin_player == 2 and player2 == false:
		GameManager.skin_player +=1
	if GameManager.skin_player == 3 and player3 == false:
		GameManager.skin_player += 1
	print("le skin du joueur est le numero " + str(GameManager.skin_player))
func _on_button_pressed() -> void:
	GameManager.skin_player -=1
	if GameManager.skin_player == 0:
		GameManager.skin_player = dernier_player_debloquer
	if GameManager.skin_player == 2 and player2 == false:
		GameManager.skin_player -=1
	if GameManager.skin_player == 3 and player3 == false:
		GameManager.skin_player -= 1
	print("le skin du joueur est le numero " + str(GameManager.skin_player))

func _on_arret_annimation_area_entered(_area: Area2D) -> void:
	marche = false
