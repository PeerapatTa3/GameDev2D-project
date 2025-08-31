extends Node

var player
var playerHP
var coin

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	player.get_node("HealthComponent")
