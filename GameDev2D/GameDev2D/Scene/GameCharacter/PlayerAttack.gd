extends State

@export var parent : Player

func enter():
	parent.attacking = true
	await get_tree().create_timer(0.5).timeout
	Transitioned.emit(self, "idle")
