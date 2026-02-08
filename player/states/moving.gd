extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	pass

func physics_update(_delta: float) -> void:
	var input_direction = Input.get_vector("move-left", "move-right", "move-up", "move-down")
	player.velocity = input_direction*player.speed
	player.move_and_slide()
	if(Input.is_action_just_pressed("dash") && player.dash_ready):
		finished.emit(DASHING)
	elif(is_equal_approx(input_direction.length(),0)):
		finished.emit(IDLE)
