extends CharacterBody2D
class_name  Player

@export var speed : int
@export var attacking : bool = false

func _physics_process(delta: float) -> void:
	if !attacking:
		var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = input_direction * speed
		if velocity.length() > 0:
			move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		attacking = true
