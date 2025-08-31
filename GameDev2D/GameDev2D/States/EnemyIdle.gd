extends State
class_name EnemyIdle

@export var pathfind : PathFindingComponent

func physic_update(delta):
	if pathfind.detected_goal:
		print("found")
		Transitioned.emit(self, "chase")
