extends Node

@onready var player = get_tree().get_first_node_in_group("Player")
var playerHP : float = 0
var coin : int = 0

func _ready() -> void:
	#playerHP = player.get_node("HealthComponent").HP
	pass

func _process(delta: float) -> void:
	pass
