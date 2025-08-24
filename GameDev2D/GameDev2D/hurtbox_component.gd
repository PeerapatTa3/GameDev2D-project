extends Area2D
class_name HurtboxComponent

signal hurt

@export var HealthComponent : HealthComponent
@export var MoveComponent : MoveComponent
@export var Iframe : float = 0

var attackable : bool = true

func damage(attack : Attack):
	if !attackable:
		return
	
	if HealthComponent:
		_handle_healthcomponent(attack)
	if MoveComponent:
		_handle_movecomponent(attack)

func _handle_healthcomponent(attack : Attack):
	HealthComponent.damage(attack)

func _handle_movecomponent(attack : Attack):
	MoveComponent.apply_knockback(attack)

func _on_hurt() -> void:
	if attackable:
		attackable = !attackable
		await get_tree().create_timer(Iframe).timeout
		attackable = !attackable
