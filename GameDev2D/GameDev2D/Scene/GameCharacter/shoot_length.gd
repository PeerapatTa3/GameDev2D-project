extends Area2D

var detect_traget : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print(body)
		detect_traget = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		detect_traget = false
