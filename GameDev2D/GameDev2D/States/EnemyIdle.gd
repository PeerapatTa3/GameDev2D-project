extends State
class_name EnemyIdle

@export var detector : PlayerDetector

func enter():
	pass

func physic_update(delta):
	if owner.isdead:
		return
	
	if detector.is_collide_with_player():
		Transitioned.emit(self, "chase")
