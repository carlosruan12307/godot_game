extends Node
class_name InputHandle
@onready var sprite = $"../../Sprite2D"
@onready var player = $"../.."
const SPEED = 300.0
@export var direction = 0
@onready var colli = $"../../CollisionPolygon2D"
# Called when the node enters the scene tree for the first time.
func inputHandlez(state : State,transitioned: Signal,doAfterSpace,doAfterRight,doAfterLeft,doAfterZ) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("C") and player.is_on_floor():
		transitioned.emit(state,"Slide")
	if Input.is_action_just_pressed("Z"):
		transitioned.emit(state,doAfterZ)
	if Input.is_action_pressed("ui_accept"):
		transitioned.emit(state,doAfterSpace)
	if direction:
		player.velocity.x = direction * SPEED
		if Input.is_action_pressed("ui_right"):
			sprite.scale.x = 1
			colli.scale.x = 1
			transitioned.emit(state,doAfterRight)
		if Input.is_action_pressed("ui_left"):
			sprite.scale.x = -1
			colli.scale.x = -1
			transitioned.emit(state,doAfterLeft)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
