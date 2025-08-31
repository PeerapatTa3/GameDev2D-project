extends Label

@export var state : StateMachine

func _process(delta: float) -> void:
	text = state.current_state.name
