extends CharacterBody2D
func _ready() -> void:
		
		scale = Vector2(3,3)

func _process(delta: float) -> void:
	
	pass

func _physics_process(delta: float) -> void:
	## Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
