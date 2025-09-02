extends Node2D

var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func picked_up():
	print("picked")
