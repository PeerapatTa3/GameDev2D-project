extends Node2D
class_name HealthComponent

@export var MAX_HP : int = 1
@export var HP_Bar : ProgressBar

@onready var parent : CharacterBody2D = get_parent()

var HP

func _ready() -> void:
	HP = MAX_HP
	if HP_Bar:
		HP_Bar.value = HP*100/MAX_HP

func Update() -> void:
	if HP_Bar:
		HP_Bar.value = HP*100/MAX_HP
	if HP <= 0:
		if parent.isdead != null:
			parent.isdead = true

func damage(attack : Attack):
	HP -= attack.attack_damage
	Update()

func heal(amount : float):
	HP += amount
	Update()
