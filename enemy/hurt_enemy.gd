extends StateEnemy

class_name HurtEnemy
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
# Called when the node enters the scene tree for the first time.
func Enter():
	animation.play("hurt")
	pass
func Exit():
	pass
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func process_state(delta: float) -> void:
	pass
func physics_process_state(delta: float) -> void:
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	
	transitioned.emit(self,"WalkEnemy")
	pass # Replace with function body.
