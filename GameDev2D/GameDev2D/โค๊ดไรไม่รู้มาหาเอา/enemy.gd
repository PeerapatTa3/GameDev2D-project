extends CharacterBody2D

@onready var player = $"../Player"

@export var ATK : int = 1
@export var HP : int = 5;
@export var speed = 200

var flash_time = 0.5
var knockback : Vector2 = Vector2.ZERO
var knockback_timer : float = 0.0
signal hit

func _ready() -> void:
	HP = 5
	update_hp()

func _physics_process(delta):
	if knockback_timer > 0:
		velocity = knockback
		knockback_timer -= delta
		if knockback_timer <= 0:
			knockback = Vector2.ZERO
	else:
		var direction = (player.position-position).normalized()
		velocity = direction * speed
		
	if velocity.length() > 0:
		move_and_slide()
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func update_hp():
	if HP <= 0:
		queue_free()
	$Label.text = "HP: " + str(HP)

func flash() -> void:
	$AnimatedSprite2D.modulate = Color(1, 0.5, 0.5)  # red-ish flash
	await get_tree().create_timer(flash_time).timeout
	$AnimatedSprite2D.modulate = Color(1, 1, 1)  # reset to normal

func apply_knockback(direction: Vector2, force: float, knockback_duration: float) -> void:
	knockback = direction * force
	knockback_timer = knockback_duration

func _on_hurt_box_area_entered(area: Area2D) -> void:
	hit.emit()
	HP -= player.ATK
	var knockback_direction = (global_position - area.global_position).normalized()
	apply_knockback(knockback_direction,900,0.2)
	flash()
	update_hp()
	print("hit")
