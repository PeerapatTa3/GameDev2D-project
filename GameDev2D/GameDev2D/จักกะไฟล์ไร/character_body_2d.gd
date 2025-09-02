extends CharacterBody2D

signal hurt

@export var speed = 400 # Player movement speed
@export var ATK = 1
@export var HP = 10

var knockback : Vector2 = Vector2.ZERO
var knockback_timer : float = 0.0
var attackable : bool = true

func get_input():
	if $AttackAnimation.is_playing():
		velocity = Vector2.ZERO
	else:
		var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = input_direction * speed

func _physics_process(delta : float):
	if knockback_timer > 0:
		velocity = knockback
		knockback_timer -= delta
		if knockback_timer <= 0:
			knockback = Vector2.ZERO
	else :
			get_input()
	sprite_direction()
	
	if not $AttackAnimation.is_playing() and $HitBox.monitorable:
		$HitBox/CollisionShape2D.disabled = true 
	if Input.is_action_just_pressed("attack") and not $AttackAnimation.is_playing():
		# Start attack animation
		$WalkingAnimation.visible = false
		$Sprite2D.visible = true
		$AttackAnimation.play(get_attack_animation())
	else:
		if velocity.length() > 0:
			move_and_slide()
			if not $AttackAnimation.is_playing():
				$WalkingAnimation.play()
		else:
			$WalkingAnimation.stop()

func sprite_direction():
	if velocity.x > 0:
		$WalkingAnimation.animation = "walking_right"
	elif velocity.x < 0:
		$WalkingAnimation.animation = "walking_left"
	elif velocity.y > 0:
		$WalkingAnimation.animation = "walking_down"
	elif velocity.y < 0:
		$WalkingAnimation.animation = "walking_up"

# Returns attack animation name based on last movement direction
func get_attack_animation() -> String:
	match $WalkingAnimation.animation:
		"walking_right": return "attack_right"
		"walking_left":  return "attack_left"
		"walking_down":  return "attack_down"
		"walking_up":    return "attack_up"
		_:               return "attack_down"  # Default

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name.begins_with("attack"):
		$WalkingAnimation.visible = true
		$Sprite2D.visible = false

func _on_hurt_box_body_entered(body: Node2D) -> void:
	if attackable && body.is_in_group("Enemys"):
		attackable = false
		$WalkingAnimation.modulate = Color.RED
		hurt.emit()
		print("Hurt")
		var knockback_direction = (global_position - body.global_position).normalized()
		apply_knockback(knockback_direction,900,0.2)
		await get_tree().create_timer(1).timeout
		attackable = true
		$WalkingAnimation.modulate = Color.WHITE

func apply_knockback(direction: Vector2, force: float, knockback_duration: float) -> void:
	knockback = direction * force
	knockback_timer = knockback_duration
