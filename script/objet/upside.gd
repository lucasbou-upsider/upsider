extends Node2D

@onready var upisde: AnimatedSprite2D = $upisde
@export var type_upside = ""

func _ready() -> void:
	if type_upside == "feu":
		upisde.play("feu")
	if type_upside == "eau" and GlobaleUpside.levier_actif == 4:
		upisde.play("eau")
		print("hello")
	else:
		upisde.play("default")
