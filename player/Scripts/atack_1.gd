extends State

class_name Atack
@onready var inputHandle = $"../Input"
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var player = $"../.."
@onready var sprite = $"../../Sprite2D"
@onready var inimigo1 = get_node("../../../../FirstPhase/Slime1")
@onready var inimigo2 = get_node("../../../../FirstPhase/Slime2")
@onready var inimigo3 = get_node("../../../../FirstPhase/Slime3")
@onready var inimigo1ProgressBar = get_node("../../../../FirstPhase/Slime1/ProgressBar")
@onready var inimigo2ProgressBar = get_node("../../../../FirstPhase/Slime2/ProgressBar")
@onready var inimigo3ProgressBar = get_node("../../../../FirstPhase/Slime3/ProgressBar")

@onready var inimigo1Animated = get_node("../../../../FirstPhase/Slime1/Sprite2D/AnimatedSprite2D")
@onready var inimigo2Animated = get_node("../../../../FirstPhase/Slime2/Sprite2D/AnimatedSprite2D")
@onready var inimigo3Animated = get_node("../../../../FirstPhase/Slime3/Sprite2D/AnimatedSprite2D")
# Called when the node enters the scene tree for the first time.
func Enter():
	var direction := Input.get_axis("ui_left", "ui_right")
	if animation.animation == "atack_1" and animation.frame == animation.sprite_frames.get_frame_count("atack_1") - 2:
		print(player.velocity.x)
		# Adicionar o objeto à camada 2
	# Remover o objeto da camada 2
		var layer_to_add = 4
		print(player.collision_layer)
		#player.set_collision_layer_value(4,false)
	
		print("Removido da camada 4")
		player.velocity.x = 300 * 10 * sprite.scale.x
		player.move_and_slide()
		
		print(player.velocity.x)
		animation.play("atack_3")
	if animation.animation == "idle" :
		animation.play("atack_1")
	elif animation.animation == "jump":
		animation.play("air_atack")

	pass
func Exit():
	
	if inimigo1.collisionp != null and inimigo1.collisionp == true:
		print("damage dealt to slime 1")
		inimigo1Animated.stop()
		inimigo1Animated.play("hurt")
		print(inimigo1ProgressBar.value)
		inimigo1ProgressBar.value = inimigo1ProgressBar.value - 50;
	if inimigo2.collisionp != null and inimigo2.collisionp == true:
		print("damage dealt to slime 2")
		inimigo1Animated.stop()
		inimigo2Animated.play("hurt")
		print(inimigo2ProgressBar.value)
		inimigo2ProgressBar.value = inimigo2ProgressBar.value - 50;
	if inimigo3.collisionp != null and inimigo3.collisionp == true:
		print("damage dealt to slime 3")
		inimigo1Animated.stop()
		inimigo3Animated.play("hurt")
		print(inimigo3ProgressBar.value)
		inimigo3ProgressBar.value = inimigo3ProgressBar.value - 50;
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
