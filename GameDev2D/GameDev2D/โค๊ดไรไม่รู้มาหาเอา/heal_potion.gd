extends Node2D

@onready var player : Player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func picked_up():
	if player:
		player.get_node("HealthComponent").heal(10)
		queue_free()
