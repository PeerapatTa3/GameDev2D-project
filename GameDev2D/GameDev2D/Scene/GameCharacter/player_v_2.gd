extends CharacterBody2D

@export var speed : float = 400

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if velocity.length() > 0:
		move_and_slide()
