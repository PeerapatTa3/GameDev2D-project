extends Node2D

@export var timer : float
@export var detection_length : int

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var parent : Node = get_parent()
@onready var original_position :Vector2 = global_position

var detected_goal : bool = false
var dir

func _ready() -> void:
	$NavigationAgent2D/Timer.start()

func _process(delta):
	if !player:
		return
	
	dir = player.global_position - global_position
	$RayCast2D.target_position = dir.normalized() * detection_length
	
	if  $RayCast2D.get_collider() is Player :
		detected_goal = true
	else :
		detected_goal = false

func get_direction() -> Vector2:
	if dir != null && detected_goal:
		return dir.normalized()
	elif !$NavigationAgent2D.is_target_reached() && !detected_goal:
		var nav_point_dir = to_local($NavigationAgent2D.get_next_path_position()).normalized()
		return nav_point_dir
	return Vector2.ZERO

func _on_timer_timeout() -> void:
	if !original_position:
		return
	if original_position != global_position && detected_goal:
		$NavigationAgent2D.target_position = original_position
