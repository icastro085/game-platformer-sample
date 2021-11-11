extends Actor

export var score: int = 100

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x

func _physics_process(delta) -> void:
	_velocity.x *= -1.0 if is_on_wall() else 1
	_velocity.y += gravity * delta
	
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _on_StompDetector_area_entered(area: Area2D) -> void:
	if area.global_position.y > $StompDetector.global_position.y:
		return
	die()

func die() -> void:
	$CollisionShape2D.disabled = true
	PlayerData.score += score
	queue_free()
