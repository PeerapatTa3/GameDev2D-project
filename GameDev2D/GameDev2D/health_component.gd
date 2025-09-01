extends Node2D
class_name HealthComponent

@export var MAX_HP : int = 0

@onready var HP = MAX_HP
@onready var parent : CharacterBody2D = get_parent()

func _ready() -> void:
	$HP_Label.text = "HP : " + str(HP)

func Update() -> void:
	$HP_Label.text = "HP : " + str(HP)
	if HP <= 0:
		if parent.isdead != null:
			parent.isdead = true

func damage(attack : Attack):
	HP -= attack.attack_damage
	Update()

func heal(amount : float):
	HP += amount
	Update()
