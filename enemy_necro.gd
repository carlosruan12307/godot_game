extends CharacterBody2D

var SPEED = 90
const JUMP_VELOCITY = -400.0
const FOLLOW_DISTANCE = 330.0  # Distância mínima para seguir quanto maior mais longe ele ataca
const RETREAT_DISTANCE = 200.0 # Distância mínima para afastar-se quando estiver muito perto
@onready var animation = $Sprite2D/AnimatedSprite2D
@onready var spriteNecro = $Sprite2D
@onready var fireball_scene = preload("res://bola_fogo.tscn")

var target = null
var direction = Vector2.ZERO
var changeDirection = true
var is_following = true
var is_retreating = false
var oneTime = false
var countDelayFires = 0
var delayFires = 70
var random_direction = Vector2.ZERO
var random_change_timer = 0.0
var random_change_interval = 2.0
func _ready() -> void:
	animation.play("walk")
#func random_move(delta: float) -> void:
	#random_change_timer += delta
	#if random_change_timer >= random_change_interval:
		#random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()  # Gera uma nova direção aleatória
		#random_change_timer = 0.0  # Reseta o timer
#
	## Suaviza a transição para a nova direção
	#direction = direction.lerp(random_direction,0.1)  # Interpola suavemente
	#velocity = direction * SPEED  # Move na direção suavizada
	#animation.play("walk")  # Reproduz a animação de caminhada
func _physics_process(delta: float) -> void:

	countDelayFires += 1;
	if target and target.is_in_group("Player"):
		var distance_to_target = position.distance_to(target.position)
		# Verifica a distância do alvo para decidir se vai seguir, atacar ou se afastar
		if distance_to_target > FOLLOW_DISTANCE:
			# Segue o alvo se estiver longe o suficiente
			is_following = true
			is_retreating = false
		elif distance_to_target <= RETREAT_DISTANCE:
			# Se estiver muito perto, recua até ficar a uma distância segura
			
			is_following = false
			is_retreating = true
			animation.play("walk")  # Volta para animação de movimento ao recuar
			SPEED = 350
		else:
			# Para de seguir e ataca se estiver na distância correta
			if countDelayFires >= delayFires:
				spawn_fireball()
				countDelayFires = 0
				
			animation.play("atack")
			is_following = false
			is_retreating = false
		
		if is_following:
			direction = (target.position - position).normalized()
			velocity = direction * SPEED
		elif is_retreating:
			direction = (position - target.position).normalized()
			velocity = direction * SPEED
		else:
			# Para de se mover quando estiver na distância correta para o ataque
			velocity = Vector2.ZERO

		# Verifica a direção e vira o sprite
		if direction.x <= 0 and changeDirection:
			spriteNecro.scale.x = spriteNecro.scale.x * -1
			changeDirection = false
		elif not changeDirection and direction.x >= 0:
			spriteNecro.scale.x = spriteNecro.scale.x * -1
			changeDirection = true
	else:
		animation.play("walk")
		#random_move(delta)
	
	move_and_slide()
func spawn_fireball():

	var fireball_instance = fireball_scene.instantiate()
	fireball_instance.position = global_position  # Define a posição inicial da bola de fogo
	
	## Inverte o sprite se estiver voltado para a esquerda
	#if spriteNecro.scale.x <= 0:
		#fireball_instance.scale.x = fireball_instance.scale.x * -1

	# Calcula a direção e o ângulo da bola de fogo em direção ao alvo
	var direction_to_target = (target.position - position).normalized()
	fireball_instance.velocity = direction_to_target * 200  # Define a velocidade na direção do alvo

	# Aplica rotação para alinhar o rastro com a direção
	fireball_instance.rotation = direction_to_target.angle()

	get_parent().add_child(fireball_instance)  # Adiciona a bola de fogo ao cenário
# Funções de detecção de entrada e saída da área
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		target = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == target:
		target = null


func _on_animated_sprite_2d_animation_finished() -> void:

	pass # Replace with function body.
