extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = 1
@onready var animation = $Sprite2D/AnimatedSprite2D
@onready var sprite = $Sprite2D
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left") : 
		sprite.scale.x = -1
	if Input.is_action_pressed("ui_right") : 
		sprite.scale.x = 1
	
func _ready() -> void:
	print(sprite)
	animation.play("default")	
func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
