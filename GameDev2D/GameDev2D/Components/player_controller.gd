extends Node2D

func get_direction() -> Vector2:
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return input_dir
