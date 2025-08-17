extends Node2D
class_name HealthComponent

@export var MAX_HP : int = 0

@onready var HP = MAX_HP

func _ready() -> void:
	$HP_Label.text = "HP : " + str(HP)

func Update() -> void:
	$HP_Label.text = "HP : " + str(HP)
	if HP <= 0:
		get_parent().queue_free()

func damage(attack : Attack):
	HP -= attack.attack_damage
	Update()
