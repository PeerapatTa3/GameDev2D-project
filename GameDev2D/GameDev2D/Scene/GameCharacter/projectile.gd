extends CharacterBody2D
class_name Projectile

@export var speed : float = 400.0
@export var lifetime : float = 2.0

var direction : Vector2 = Vector2.ZERO

func _ready() -> void:
	# Auto-remove after lifetime
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func set_direction(dir: Vector2) -> void:
	self.rotation = dir.angle()
	direction = dir.normalized()

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		velocity = direction * speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			_on_hit(collision)

func _on_hit(collision: KinematicCollision2D) -> void:
	# Example: remove projectile on hit
	if collision:
		queue_free()
