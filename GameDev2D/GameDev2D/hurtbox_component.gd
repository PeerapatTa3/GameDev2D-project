extends Area2D
class_name HurtboxComponent

@export var HealthComponent : HealthComponent
@export var MoveComponent : MoveComponent

func damage(attack : Attack):
	if HealthComponent:
		HealthComponent.damage(attack)
		if MoveComponent:
			MoveComponent.apply_knockback(attack)
