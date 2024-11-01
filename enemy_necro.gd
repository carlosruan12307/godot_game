extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
@onready var animation = $Sprite2D/AnimatedSprite2D
var target = null
var direction = 0
var changeDirection = true;
func _ready() -> void:
	animation.play("Idle")
func _physics_process(delta: float) -> void:
	if target:
		direction = (target.position - position).normalized()
		if direction.x <= 0 and changeDirection:
			scale.x = scale.x * -1
			changeDirection = false
		elif  !changeDirection and direction.x >= 0:
			scale.x = scale.x * -1
			changeDirection = true
		#elif changeDirection:
			#scale.x = scale.x * -1
			#changeDirection = true
		velocity = direction * SPEED
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		target = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	target = null
	pass # Replace with function body.
