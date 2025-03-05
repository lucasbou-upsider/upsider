extends AnimatedSprite2D

@onready var description_skin: Label = $"../description_skin"
@onready var etoile_skin: AnimatedSprite2D = $"../étoile_skin"


var marche = true

func _ready() -> void:
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

	#afficher l'etoile
	if GameManager.skin_player == 2:
		etoile_skin.visible = false

	#animation
	if marche == true:
		position.x += 2
		if GameManager.skin_player == 1:
			play("marche_base")
		if GameManager.skin_player == 2:
			play("marche_nerd")
		if GameManager.skin_player == 3:
			play("marche_sylvan")



func _on_button_2_pressed() -> void:
	GameManager.skin_player += 1
func _on_button_pressed() -> void:
	GameManager.skin_player -=1


func _on_arret_annimation_area_entered(_area: Area2D) -> void:
	marche = false
