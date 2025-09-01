extends State

@export var parent : Player
@export var sprite : Sprite2D

func enter():
	await  get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://gameover.tscn")


	
