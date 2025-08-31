extends State
class_name EnemyIdle

@export var pathfind : PathFindingComponent
var parent

func enter():
	parent = get_parent().parent

func physic_update(delta):
	if parent.isdead:
		return
	
	if pathfind.detected_goal:
		Transitioned.emit(self, "chase")
