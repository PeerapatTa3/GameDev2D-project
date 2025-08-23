extends Node2D
class_name MoveComponent

var knockback_timer : float = 0
var knockback_strenght :float = 0
var knockback_dir = Vector2.ZERO
var velocity : Vector2

@onready var parent = get_parent()

func _physics_process(delta: float) -> void:
	if parent.has_method("move_and_slide"):
		if knockback_timer > 0:
			parent.velocity = knockback_dir * knockback_strenght
			parent.move_and_slide()
			knockback_timer -= delta
			if knockback_timer <= 0:
				knockback_timer = 0

func apply_knockback(attack : Attack):
	knockback_timer = attack.knockback_timer
	knockback_strenght = attack.knockback_strength
	knockback_dir = (parent.global_position - attack.attack_position)
