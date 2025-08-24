extends Node2D

@export var timer : float

@onready var parent : Node = get_parent()
@onready var goal = parent.goal

func _ready() -> void:
	$NavigationAgent2D/Timer.start()

func get_direction() -> Vector2:
	if !$NavigationAgent2D.is_target_reached():
		var nar_target_dir = to_local($NavigationAgent2D.get_next_path_position()).normalized()
		return nar_target_dir
	return Vector2.ZERO

func _on_timer_timeout() -> void:
	if !goal:
		return
	if $NavigationAgent2D.target_position != goal.global_position:
			$NavigationAgent2D.target_position = goal.global_position
	$NavigationAgent2D/Timer.start()
