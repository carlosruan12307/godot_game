extends CharacterBody2D

var direcao = -1
@export var distancia : int # Distância máxima que o personagem pode percorrer
var pump = 0.01
const JUMP_VELOCITY = -400.0
var first = true
var isAtak = false
var Hit = 1
@onready var colli = $CollisionPolygon2D
@onready var sprite =  $Sprite2D
@onready var animation  = $Sprite2D/AnimatedSprite2D
@onready var ray = $RayCast2D
var previous_normal = Vector2.UP  # Normal padrão
@export var SPEED = 0

var initial_position = Vector2.ZERO  # Posição inicial do personagem

func _ready() -> void:
	initial_position = position  # Salva a posição inicial
	ray.enabled = true
	animation.play("walk")

func _physics_process(delta: float) -> void:
	var COR = get_last_slide_collision()
	if !isAtak:
		velocity.x = SPEED * direcao
	
	# Verifica colisões com o RayCast
	var colliDD = ray.get_collider()
	if colliDD is Node and colliDD.is_in_group("Player"):
		isAtak = true
		animation.play("atack1")
	elif colliDD is StaticBody2D or colliDD is Area2D or colliDD is CharacterBody2D and (colliDD.is_in_group("Wall") or colliDD.is_in_group("Enemy")):
		# Inverte a direção em caso de colisão com parede ou inimigo
		direcao = direcao * -1
		animation.scale.x = animation.scale.x * -1
		ray.scale.x = ray.scale.x * -1 
		velocity.x = SPEED * direcao
	else:
		isAtak = false
		animation.play("default")
	
	# Calcula a distância percorrida
	
	var distance_traveled = position.distance_to(initial_position)
	print(distance_traveled)
	if distance_traveled >= distancia:
		
		# Inverte a direção quando atingir a distância máxima
		direcao *= -1
		animation.scale.x *= -1
		ray.scale.x *= -1
		velocity.x = SPEED * direcao
		initial_position = position  # Reseta a posição inicial para a nova direção

	# Adiciona gravidade se o personagem não estiver no chão
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Move o personagem e aplica o movimento de "snap" ao chão
	move_and_slide()
	apply_floor_snap()

	# Ajusta a rotação com base na normal do chão
	var normal = get_floor_normal()
	normal = previous_normal.lerp(normal, 0.07)
	var angle = normal.angle_to(Vector2.UP)
	rotation = -angle
	previous_normal = normal

func _on_animated_sprite_2d_animation_finished() -> void:
	print("finish")
	pass # Substitua com o corpo da função se necessário
