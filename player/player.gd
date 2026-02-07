extends CharacterBody2D

@export var speed = 70
@export var dash_mult = 3
@export var dash_length = 0.25
@export var dash_cooldown = 1

var dash_ready = true
var dash_active = false
var pre_velocity = Vector2.ZERO

func _ready() -> void:
	$DashTimer.wait_time = dash_length
	$DashTimer/DashCooldown.wait_time = dash_cooldown


func _process(delta: float) -> void:
	if(Input.get_vector("move-left", "move-right", "move-up", "move-down").x <0):
		$Sprite2D.flip_h = true
	elif(Input.get_vector("move-left", "move-right", "move-up", "move-down").x > 0):
		$Sprite2D.flip_h = false

func _physics_process(delta: float) -> void:
	if(dash_active):
		velocity = pre_velocity*dash_mult
	else:
		velocity = pre_velocity
	move_and_slide()

func _input(event: InputEvent) -> void:
	var input_direction = Input.get_vector("move-left", "move-right", "move-up", "move-down")
	pre_velocity = input_direction*speed
	if(event.is_action_pressed("dash") && dash_ready):
		$DashTimer.start()
		dash_active=true
		dash_ready=false

func _on_dash_timer_timeout() -> void:
	dash_active=false
	$DashTimer/DashCooldown.start()

func _on_dash_cooldown_timeout() -> void:
	dash_ready = true
