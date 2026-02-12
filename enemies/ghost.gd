extends CharacterBody2D

@export var speed = 400
var movement_Target: Vector2 = Vector2(20,20)
func _ready() -> void:
	actor_setup.call_deferred()

func actor_setup():
	await get_tree().physics_frame

func set_movement_target(movement_target: Vector2):
	$NavigationAgent.target_position = movement_target


func _physics_process(delta: float) -> void:
	if $NavigationAgent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = $NavigationAgent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * speed
	move_and_slide()
