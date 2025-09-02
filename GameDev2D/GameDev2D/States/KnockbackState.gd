extends State
class_name KnockbackState

@export var sfx_hurt : AudioStreamPlayer

var knockback_strength : float = 0
var knockback_duration : float = 0
var knockback_positon : Vector2

var velocity : Vector2 = Vector2.ZERO

func enter():
	pass

func physic_update(delta):
	if owner.isdead:
		Transitioned.emit(self, "dead")
		return
	
	if !owner.has_method("move_and_slide"):
		return
	
	if knockback_duration > 0:
		var dir = (owner.global_position - knockback_positon).normalized()
		velocity = dir * knockback_strength
		owner.velocity = velocity
		owner.move_and_slide()
		knockback_duration -= delta
	else :
		owner.velocity = Vector2.ZERO
		Transitioned.emit(self, "idle")

func update(delta):
	if owner.isdead:
		Transitioned.emit(self, "dead")

func apply_knockback(attack : Attack):
	if sfx_hurt:
		sfx_hurt.play()
	knockback_duration = attack.knockback_timer
	knockback_strength = attack.knockback_strength
	knockback_positon = attack.attack_position
