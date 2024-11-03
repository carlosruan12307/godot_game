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
@onready var ray = %RayCast2D
@onready var inimigo1Animated = get_node("../../../../FirstPhase/Slime1/Sprite2D/AnimatedSprite2D")
@onready var inimigo2Animated = get_node("../../../../FirstPhase/Slime2/Sprite2D/AnimatedSprite2D")
@onready var inimigo3Animated = get_node("../../../../FirstPhase/Slime3/Sprite2D/AnimatedSprite2D")
var AtackDamageToSLime = 50
var has_attacked = false  # Nova variável para rastrear se o dano já foi aplicado

func Enter():
	if animation.animation == "idle":
		animation.play("atack_1")
		has_attacked = false  # Reseta para permitir dano no próximo ataque
	elif animation.animation == "jump":
		animation.play("air_atack")

		

	if animation.animation == "atack_1"  and animation.frame >= animation.sprite_frames.get_frame_count("atack_1") - 2:
		#if ray.get_collider():
			#has_attacked = true  # Define que o ataque já foi realizado
			#var colliderEnemy = ray.get_collider()
			#var lifeEnemy = colliderEnemy.find_child("ProgressBar", true, false)
			#lifeEnemy.value -= AtackDamageToSLime
			#colliderEnemy.find_child("StateMachineEnemy", true, false).current_state.transitioned.emit(
				#colliderEnemy.find_child("StateMachineEnemy", true, false).current_state, "HurtEnemy"
			#)
		player.remove_from_group("Player")
		player.velocity.x = 300 * 10 * sprite.scale.x
		player.move_and_slide()
		animation.play("atack_3")



func Exit():
	player.add_to_group("Player")
	pass

func Update():
	pass

func _ready() -> void:
	pass

func process_state(delta: float) -> void:
	if ray.is_colliding() and ray.get_collider().is_in_group("Enemy") and not has_attacked and animation.frame >= animation.sprite_frames.get_frame_count("atack_1") - 3 :
		has_attacked = true  # Define que o ataque já foi realizado
		var colliderEnemy = ray.get_collider()
		var lifeEnemy = colliderEnemy.find_child("ProgressBar", true, false)
		lifeEnemy.value -= AtackDamageToSLime
		colliderEnemy.find_child("StateMachineEnemy", true, false).current_state.transitioned.emit(
			colliderEnemy.find_child("StateMachineEnemy", true, false).current_state, "HurtEnemy"
		)
	if animation.animation == "air_atack":
		if player.is_on_floor():
			transitioned.emit(self, "idle")
		else:
			inputHandle.inputHandlez(self, transitioned, "", "run", "run", "atack")
	else:
		inputHandle.inputHandlez(self, transitioned, "jump", "run", "run", "atack")

func physics_process_state(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
