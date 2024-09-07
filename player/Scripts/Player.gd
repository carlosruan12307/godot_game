extends CharacterBody2D
@onready var animation =  $Sprite2D/AnimatedSprite2D
@onready var sprite = $Sprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const jump_duration = 0.5

var is_jumping = false
var is_walking = false


@onready var timer = $Sprite2D/Timer

func _ready() -> void:

		scale = Vector2(3,3)

func _process(delta: float) -> void:
	
	if animation.animation == "run" and velocity == Vector2.ZERO:
		animation.play("idle")
	if animation.animation == "jump" and is_on_floor() and is_jumping:
		animation.play("idle")
		is_jumping = false

func _physics_process(delta: float) -> void:
		# Handle jump.
	
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		animation.play("jump")
		await get_tree().create_timer(.5).timeout
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		
		velocity.x = direction * SPEED
		if Input.is_action_pressed("ui_right"):
			is_walking = true
			sprite.scale.x = 1
			animation.play("run")
		if Input.is_action_pressed("ui_left"):
			is_walking = true
			sprite.scale.x = -1
			animation.play("run")
	else:
		is_walking = false
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
