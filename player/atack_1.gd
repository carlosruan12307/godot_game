extends State

class_name Atack1
@onready var inputHandle = $"../Input"
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
# Called when the node enters the scene tree for the first time.
func Enter():
	animation.play("atack_1")
	print(animation.autoplay)
	pass
func Exit():
	pass
func Update():
	pass
func _ready() -> void:
	pass # Replace with function body.
func process_state(delta: float) -> void:
	inputHandle.inputHandlez(self,transitioned,"jump","run","run","atack1")
	pass
func physics_process_state(delta: float) -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	print("acabou")
	pass # Replace with function body.
