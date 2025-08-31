extends State
class_name KnockbackState

@export var parent : CharacterBody2D

var knockback_strength : float = 0
var knockback_duration : float = 0
var knockback_positon : Vector2

var velocity : Vector2 = Vector2.ZERO
var speed : int

func enter():
	speed = parent.speed

func physic_update(delta):
	var dir = (knockback_positon - parent.global_position).normalized()
	velocity = dir * speed
	parent.velocity = velocity
	parent.move_and_slide()

func apply_knockback(attack : Attack):
	knockback_duration = attack.knockback_timer
	knockback_strength = attack.knockback_strength
	knockback_positon = knockback_positon
