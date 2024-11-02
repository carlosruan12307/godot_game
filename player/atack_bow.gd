extends State

class_name AtackBow
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var player = $"../.."
@onready var spritePlayer = $"../../Sprite2D"
@onready var enemy = get_node("../../../EnemyNecro")
var original_rotation = 0.0  # Variável para armazenar a rotação original do playev
var original_scale = 0.0
var is_attacking = false 
# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func Enter():
	if is_attacking:
		return;
	is_attacking = true
	player.velocity = Vector2.ZERO
	original_rotation = spritePlayer.rotation 
	original_scale = spritePlayer.scale
	# Ajusta a escala do jogador com base na posição do inimigo
	#update_player_scale()
	rotate_player_towards_enemy()  # Rotaciona antes de iniciar a animação
	animation.play("teste")  # Inicia a animação de ataque
	pass

func Exit():
	pass

func Update():
	pass

func _ready() -> void:
	pass # Replace with function body.

func process_state(delta: float) -> void:
	pass

func physics_process_state(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func _physics_process(delta: float) -> void:
	pass

func rotate_player_towards_enemy():

	var direction = (enemy.global_position - spritePlayer.global_position).normalized()
	if spritePlayer.scale.x >= 0 and direction.x <= 0:
		spritePlayer.scale.y = -1
	elif spritePlayer.scale.x <= 0 and direction.x <= 0:
		direction = direction * -1
	elif spritePlayer.scale.x <= 0 and  direction.x >= 0:
		direction = direction * -1
		spritePlayer.scale.y = -1
		
	print(direction)
	spritePlayer.rotation = direction.angle()  # Rotaciona o jogador para olhar em direção ao inimigo

func update_player_scale():
	# Verifica se o inimigo está à esquerda ou à direita do jogador
	if enemy.global_position.y < player.global_position.y:
		spritePlayer.scale.y = -1  # Inverte o eixo X se o inimigo estiver à esquerda
	else:
		spritePlayer.scale.y = 1  # Mantém a escala normal se o inimigo estiver à direita

func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "teste":
		spritePlayer.rotation = original_rotation
		spritePlayer.scale = original_scale
		is_attacking = false
		transitioned.emit(self,"Idle")  # Emite a transição para o estado "Idle"
	pass # Replace with function body
