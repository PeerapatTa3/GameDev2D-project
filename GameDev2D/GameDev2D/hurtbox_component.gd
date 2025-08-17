extends Area2D
class_name HurtboxComponent

@export var HealthComponent : HealthComponent

func damage(attack : Attack):
	if HealthComponent:
		HealthComponent.damage(attack)
