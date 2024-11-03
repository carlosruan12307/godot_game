extends StateNecro

class_name WalkNecro
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
# Called when the node enters the scene tree for the first time.
func Enter():

	animation.play("walk")
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
