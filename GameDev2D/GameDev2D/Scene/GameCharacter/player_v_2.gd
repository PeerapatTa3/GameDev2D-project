extends CharacterBody2D
class_name  Player

@export var speed : int
@export var attacking : bool = false
var isdead : bool = false

func _ready() -> void:
	GameStat.player = self
	print(self.name)
