extends State

@export var attack_range : float = 0

func enter():
	owner.attacking = true
	await get_tree().create_timer(0.5).timeout
	owner.attacking = false
	Transitioned.emit(self, "chase")
