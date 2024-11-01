extends Sprite2D

var pressedC = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("C") or pressedC:
		global_position = get_viewport().get_mouse_position()
		pressedC = true
	pass
