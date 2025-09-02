extends Node2D

@export var amount : int = 0

func picked_up():
	AudioManager.coin.play()
	GameStat.coin += amount
	queue_free()
