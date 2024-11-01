extends StateEnemy

class_name WalkEnemy
var direcao = -1
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var enemy = $"../.."
@onready var ray = $"../../RayCast2D"
var timeDamage = 0;
var timeBeetweenDamage = 40
@onready var lifePlayer = get_node("../../../Player/ProgressBarPlayer")
@onready var state = get_node("../../../Player/State Machine")
@onready var playerAnimation = get_node("../../../Player/Sprite2D/AnimatedSprite2D")
var isAtak = false
var initial_position = 0;
var previous_normal = Vector2.UP;
# Called when the node enters the scene tree for the first time.
func Enter():
	animation.play("walk")
	pass
func _ready() -> void:
	initial_position = enemy.position
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func process_state(delta: float) -> void:
	
		# Verifica colisões com o RayCast
	var rayCollision = ray.get_collider()
	if rayCollision is Node and rayCollision.is_in_group("Player"):

				
		
		transitioned.emit(self,"AtackEnemy")
	if rayCollision is StaticBody2D or rayCollision is Area2D or rayCollision is CharacterBody2D and (rayCollision.is_in_group("Wall") or rayCollision.is_in_group("Enemy")):
		# Inverte a direção em caso de colisão com parede ou inimigo
		direcao = direcao * -1
		animation.scale.x = animation.scale.x * -1
		ray.scale.x = ray.scale.x * -1 
		enemy.velocity.x = enemy.SPEED * direcao
	#else:
#
		#enemy.collisionp = false
		
	
	
	
	enemy.velocity.x = enemy.SPEED * direcao
	
	
		# Calcula a distância percorrida
	
	var distance_traveled = enemy.position.distance_to(initial_position)
	
	if distance_traveled >= enemy.distancia:
		# Inverte a direção quando atingir a distância máxima
		direcao *= -1
		animation.scale.x *= -1
		enemy.ray.scale.x *= -1
		enemy.velocity.x = enemy.SPEED * direcao
		initial_position = enemy.position  # Reseta a posição inicial para a nova direção

	# Adiciona gravidade se o personagem não estiver no chão
	if not enemy.is_on_floor():
		enemy.velocity += enemy.get_gravity() * delta

	# Move o personagem e aplica o movimento de "snap" ao chão
	enemy.move_and_slide()
	enemy.apply_floor_snap()

	# Ajusta a rotação com base na normal do chão
	var normal = enemy.get_floor_normal()
	normal = previous_normal.lerp(normal, 0.07)
	var angle = normal.angle_to(Vector2.UP)
	enemy.rotation = -angle
	previous_normal = normal
	pass
func physics_process_state(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass
