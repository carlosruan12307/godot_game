extends State

class_name Hurt
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var player = $"../.."
@onready var spritePlayer = $"../../Sprite2D"
# Called when the node enters the scene tree for the first time.
func Enter():
	player.velocity = Vector2.ZERO
	animation.play("hurt")
	pass
func Exit():
	pass
func Update():
	pass
func _ready() -> void:
	pass # Replace with function body.
func process_state(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		transitioned.emit(self,"Idle")
	pass
func physics_process_state(delta: float) -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	#print(spritePlayer.scale.x)
	#if spritePlayer.scale.x > 0:
		#player.position.x = player.position.x - 90
	#else:
		#player.position.x = player.position.x + 90
	transitioned.emit(self,"Idle")
	pass # Replace with function body.
