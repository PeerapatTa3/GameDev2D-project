extends Node

func move_style(speed : int, parent):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var velocity = input_direction * speed
	if velocity.length() > 0:
		parent.velocity = velocity
		parent.move_and_slide()
