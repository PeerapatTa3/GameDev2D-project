extends Area2D
class_name HurtboxComponent

signal hurt

@export var Healthcomponent : HealthComponent
@export var Movecomponent : Node
@export var Iframe : float = 0

var attackable : bool = true

func damage(attack : Attack):
	if !attackable:
		return
	
	if Healthcomponent:
		_handle_healthcomponent(attack)
	if Movecomponent:
		_handle_movecomponent(attack)

func _handle_healthcomponent(attack : Attack):
	Healthcomponent.damage(attack)

func _handle_movecomponent(attack : Attack):
	Movecomponent.apply_knockback(attack)

func _on_hurt() -> void:
	if attackable:
		attackable = !attackable
		await get_tree().create_timer(Iframe).timeout
		attackable = !attackable
