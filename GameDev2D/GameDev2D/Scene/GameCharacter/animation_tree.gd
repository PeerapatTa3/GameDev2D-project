extends AnimationTree

@onready var parent : CharacterBody2D = get_parent()

var last_faced_dir

func _physics_process(_delta: float) -> void:
	var idle = !parent.velocity
	
	if !idle:
		last_faced_dir = parent.velocity.normalized()
	
	set("parameters/walk/blend_position", last_faced_dir)
	set("parameters/idle/blend_position", last_faced_dir)
	set("parameters/attack/blend_position", last_faced_dir)
