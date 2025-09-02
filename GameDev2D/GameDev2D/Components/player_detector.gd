extends RayCast2D
class_name PlayerDetector

@export var length : float = 0

@onready var player : Player = get_tree().get_first_node_in_group("Player")

var collide_with_player : bool = false

func _process(delta: float) -> void:
	if !player || player.isdead:
		return
	
	target_position = (player.global_position - global_position).normalized() * length

func is_collide_with_player() -> bool:
	if collide_with_bodies:
		if get_collider() is Player:
			return true
	return false

func get_direction() -> Vector2:
	return target_position.normalized()

func get_length_to_player() -> float:
	return (player.global_position - global_position).length()
