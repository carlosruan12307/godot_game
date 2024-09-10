extends CharacterBody2D
func _ready() -> void:
		
		scale = Vector2(3,3)

func _process(delta: float) -> void:
	#for i in range(get_slide_collision_count()):
		#var collision = get_slide_collision(i)
		#if collision:
			#print("Colidiu com: ", collision.get_collider())
	pass

func _physics_process(delta: float) -> void:
	## Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
