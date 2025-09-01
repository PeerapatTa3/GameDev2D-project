extends Area2D
class_name ItemCompoenent

@export var Item : Node

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and Item:
		Item.picked_up()
		get_parent().queue_free()
