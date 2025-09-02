extends Area2D
class_name HurtboxComponent

@export var Deathparticle : GPUParticles2D
@export var Healthcomponent : HealthComponent
@export var state : StateMachine
@export var Iframe : float = 0

var attackable : bool = true

func damage(attack : Attack):
	if !attackable:
		return
	attackable = false
	if Healthcomponent:
		if Deathparticle:
			Deathparticle.restart()
		_handle_healthcomponent(attack)
	if state:
		_handle_state(attack)
	_on_hurt()

func _handle_healthcomponent(attack : Attack):
	Healthcomponent.damage(attack)

func _handle_state(attack : Attack):
	state.current_state.Transitioned.emit(state.current_state,"knockback")
	state.current_state.apply_knockback(attack)

func _on_hurt() -> void:
	await get_tree().create_timer(Iframe).timeout
	attackable = true
