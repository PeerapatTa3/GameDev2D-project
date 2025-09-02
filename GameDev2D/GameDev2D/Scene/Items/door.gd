extends Node2D

@export var to_scene : PackedScene

func picked_up():
	if GameStat.coin >= 20:
		# Defer both the free and the scene change
		call_deferred("_deferred_open_door")
	print("contact with door")

func _deferred_open_door():
	queue_free()
	get_tree().change_scene_to_packed(to_scene)
