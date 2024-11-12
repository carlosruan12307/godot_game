extends StateNecro

class_name DeadNecro
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var stateNecro = $".."
@onready var necro = $"../.."
@onready var ShaderRect = get_node("../../../ColorRect")

# Called when the node enters the scene tree for the first time.
func Enter():
	ShaderRect.material.set_shader_parameter("raio", 100)
	animation.play("dead")
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
	if animation.animation == "dead":
		necro.queue_free()
	pass # Replace with function body.