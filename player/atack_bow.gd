extends State

class_name AtackBow

@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var player = $"../.."
@onready var spritePlayer = $"../../Sprite2D"
@onready var enemy = get_node("../../../EnemyNecro")

var original_scale = Vector2(1, 1)  # Variável para armazenar a escala original do jogador
var is_attacking = false  # Indica se o jogador está atacando

# Called when the node enters the scene tree for the first time.
func Enter():
	if is_attacking:
		return
	is_attacking = true
	player.velocity = Vector2.ZERO  # Para o movimento do jogador
	original_scale = spritePlayer.scale  # Armazena a escala original
	#update_player_scale()
	rotate_player_towards_enemy()  # Rotaciona o jogador em direção ao inimigo
	animation.play("teste")  # Inicia a animação de ataque

func Exit():
	pass

func Update():
	pass

func _ready() -> void:
	pass

func process_state(delta: float) -> void:
	pass

func physics_process_state(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
func update_player_scale():
	# Verifica se o inimigo está à esquerda ou à direita do jogador
	if enemy.global_position.y < player.global_position.y:
		spritePlayer.scale.y = -1  # Inverte o eixo X se o inimigo estiver à esquerda
	else:
		spritePlayer.scale.y = 1  # Mantém a escala normal se o inimigo estiver à direita
func rotate_player_towards_enemy():
	var direction = (enemy.global_position - spritePlayer.global_position).normalized()
	 # Rotaciona o jogador para olhar em direção ao inimigo

	# Define a escala com base na direção
	#if direction.x < 0:
		#spritePlayer.scale.x = -1  # Inverte a escala no eixo X se o inimigo estiver à esquerda
	#else:
		#spritePlayer.scale.x = 1  # Mantém a escala normal se o inimigo estiver à direita
	if spritePlayer.scale.x >= 0 and direction.x <= 0:
		spritePlayer.scale.y = -1
	elif spritePlayer.scale.x <= 0 and direction.x <= 0:
		
		direction = direction * -1
	elif spritePlayer.scale.x <= 0 and  direction.x >= 0:
		direction = direction * -1
		spritePlayer.scale.y = -1
	spritePlayer.rotation = direction.angle() 
func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "teste":
		spritePlayer.rotation = 0  # Reseta a rotação após o ataque
		spritePlayer.scale = original_scale  # Restaura a escala original
		is_attacking = false  # Define o estado de ataque como falso
		transitioned.emit(self, "Idle")  # Emite a transição para o estado "Idle"
