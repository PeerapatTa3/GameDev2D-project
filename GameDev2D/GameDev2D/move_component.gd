extends Node2D
class_name MoveComponent

var knockback_timer: float = 0.0
var knockback_strength: float = 0.0
var knockback_dir: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

@export var move_style: Node
@export var speed: int

@onready var parent = get_parent()


func _physics_process(delta: float) -> void:
	if !parent.has_method("move_and_slide"):
		return
	
	if knockback_timer > 0.0:
		_handle_knockback(delta)
	else:
		_handle_movement()
	
	parent.move_and_slide()


func _handle_knockback(delta: float) -> void:
	parent.velocity = knockback_dir * knockback_strength
	knockback_timer = max(knockback_timer - delta, 0.0)
	
	if knockback_timer == 0.0:
		parent.velocity = Vector2.ZERO


func _handle_movement() -> void:
	if move_style.has_method("get_direction"):
		velocity = move_style.get_direction() * speed
		parent.velocity = velocity if velocity.length() > 0 else Vector2.ZERO
	else:
		parent.velocity = Vector2.ZERO


func apply_knockback(attack: Attack) -> void:
	knockback_timer = attack.knockback_timer
	knockback_strength = attack.knockback_strength
	knockback_dir = (parent.global_position - attack.attack_position).normalized()
