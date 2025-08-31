extends State

@export var parent : Player

func enter():
	parent.attacking = true

func update(delta):
	if !parent.attacking:
		Transitioned.emit(self, "idle")
