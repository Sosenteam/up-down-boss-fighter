class_name Player extends CharacterBody2D

@export var speed = 70
@export var dash_mult = 3
@export var dash_length = 0.25
@export var dash_cooldown = 1
@export var max_stamina = 100
@export var max_health = 100
@export var invincibility_time = 0.2

var health = max_health
var hurtbox_colliding = false
var invincibile = false
var attacker

var stamina = max_stamina

var dash_ready = true
var dash_active = false
var pre_velocity = Vector2.ZERO
var mouse_position: Vector2

func _ready() -> void:
	$DashTimer.wait_time = dash_length
	$DashTimer/DashCooldown.wait_time = dash_cooldown


func _process(delta: float) -> void:
	if(Input.get_vector("move-left", "move-right", "move-up", "move-down").x <0):
		$PlayerSprite.flip_h = true
	elif(Input.get_vector("move-left", "move-right", "move-up", "move-down").x > 0):
		$PlayerSprite.flip_h = false

func _physics_process(delta: float) -> void:
	print(health)

func _input(event: InputEvent) -> void:
	if(event is InputEventMouseMotion):
		mouse_position = event.position

func _on_dash_timer_timeout() -> void:
	dash_active=false
	$DashTimer/DashCooldown.start()

func _on_dash_cooldown_timeout() -> void:
	dash_ready = true

func take_damage(attack: Attack):
	if(!$InvicibilityTimer.is_stopped()):
		return
	health-=attack.attack_damage
	$InvicibilityTimer.start()
