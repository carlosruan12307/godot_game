extends State

class_name Slide
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var player = $"../.."
@onready var spritePlayer = $"../../Sprite2D"
# Called when the node enters the scene tree for the first time.
func Enter():
	player.remove_from_group("Player")
	animation.play("slide")
	player.velocity.x = 900 * spritePlayer.scale.x

	pass
func Exit():
	player.add_to_group("Player")
	pass
func Update():
	pass
func _ready() -> void:
	pass # Replace with function body.
func process_state(delta: float) -> void:

	pass
func physics_process_state(delta: float) -> void:
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:

	#if spritePlayer.scale.x > 0:
		#player.position.x = player.position.x - 90
	#else:
		#player.position.x = player.position.x + 90
	transitioned.emit(self,"Idle")
	pass # Replace with function body.
