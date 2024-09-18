extends State

class_name Atack
@onready var inputHandle = $"../Input"
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var player = $"../.."
@onready var sprite = $"../../Sprite2D"
# Called when the node enters the scene tree for the first time.
func Enter():
	var direction := Input.get_axis("ui_left", "ui_right")
	if animation.animation == "atack_1" and animation.frame == animation.sprite_frames.get_frame_count("atack_1") - 2:
		print(player.velocity.x)
		# Adicionar o objeto à camada 2
	# Remover o objeto da camada 2
		var layer_to_add = 4
		print(player.collision_layer)
		player.set_collision_layer_value(4,false)
	
		print("Removido da camada 4")
		player.velocity.x = 300 * 10 * sprite.scale.x
		player.move_and_slide()
		
		print(player.velocity.x)
		animation.play("atack_2")
	if animation.animation == "idle" :
		animation.play("atack_1")
	elif animation.animation == "jump":
		animation.play("air_atack")

	pass
func Exit():
	pass
func Update():
	pass
func _ready() -> void:
	pass # Replace with function body.
func process_state(delta: float) -> void:
	
	if animation.animation == "air_atack":
		if player.is_on_floor():
			transitioned.emit(self,"idle")
		else:
			inputHandle.inputHandlez(self,transitioned,"","run","run","atack")		
	else:
		inputHandle.inputHandlez(self,transitioned,"jump","run","run","atack")
	pass
func physics_process_state(delta: float) -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	print("ataque voador acabou")

	pass # Replace with function body.
