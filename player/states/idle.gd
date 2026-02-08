extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity = Vector2.ZERO


func physics_update(_delta: float) -> void:
	player.move_and_slide()
	if(
		Input.is_action_pressed("move-down")
		or Input.is_action_pressed("move-up")
		or Input.is_action_pressed("move-left")
		or Input.is_action_pressed("move-right")
	):
		finished.emit(MOVING)
