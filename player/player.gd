class_name Player extends CharacterBody2D

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
		$PlayerSprite.flip_h = true
		$Weapon.scale.x = -1
	elif(Input.get_vector("move-left", "move-right", "move-up", "move-down").x > 0):
		$PlayerSprite.flip_h = false
		$Weapon.scale.x = 1

func _on_dash_timer_timeout() -> void:
	dash_active=false
	$DashTimer/DashCooldown.start()

func _on_dash_cooldown_timeout() -> void:
	dash_ready = true
