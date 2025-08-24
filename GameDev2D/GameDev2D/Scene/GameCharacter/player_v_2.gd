extends CharacterBody2D
class_name  Player

@export var attacking : bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		attacking = true
