extends State
class_name KnockbackState

@export var parent : CharacterBody2D

var knockback_strength : float = 0
var knockback_duration : float = 0
var knockback_positon : Vector2

var velocity : Vector2 = Vector2.ZERO

func physic_update(delta):
	if knockback_duration > 0:
		var dir = (parent.global_position - knockback_positon).normalized()
		velocity = dir * knockback_strength
		parent.velocity = velocity
		parent.move_and_slide()
		knockback_duration -= delta
	else :
		knockback_duration = 0
		parent.velocity = Vector2.ZERO
		Transitioned.emit(self, "idle")

func apply_knockback(attack : Attack):
	knockback_duration = attack.knockback_timer
	knockback_strength = attack.knockback_strength
	knockback_positon = attack.attack_position
