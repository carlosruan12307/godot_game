extends CharacterBody2D

var direcao = -1
@export var distancia : int # Distância máxima que o personagem pode percorrer
var pump = 0.01
const JUMP_VELOCITY = -400.0
var first = true
var isAtak = false
var Hit = 1
@onready var state = get_node("../../Player/State Machine")
@onready var colli = $CollisionPolygon2D
@onready var sprite =  $Sprite2D
@onready var animation  = $Sprite2D/AnimatedSprite2D
@onready var ray = $RayCast2D
@onready var playerAnimation = get_node("../../Player/Sprite2D/AnimatedSprite2D")
@onready var lifePlayer = get_node("../../Player/ProgressBar")
var timeBeetweenDamage = 40
@export var collisionp = false;
var previous_normal = Vector2.UP  # Normal padrão
var timeDamage = 0;
@export var SPEED = 0

var initial_position = Vector2.ZERO  # Posição inicial do personagem

func _ready() -> void:
	  # Salva a posição inicial
	ray.enabled = true
	

func _physics_process(delta: float) -> void:
	pass

		

	# Verifica colisões com o RayCast
	#var rayCollision = ray.get_collider()
	#if rayCollision is Node and rayCollision.is_in_group("Player"):
		#collisionp = true
		##if playerAnimation.animation == "atack_1":
			##print("recebendo dano")
		#timeDamage += 1;
		#isAtak = true
		#if timeDamage >= timeBeetweenDamage:
			#timeDamage = 0
			#lifePlayer.value = lifePlayer.value - 10
			#if lifePlayer.value == 0 && playerAnimation.animation != "dead":
				#playerAnimation.play("dead")
				#state.queue_free()
				#print("dead")
				#
		#
		#animation.play("atack1")
	#elif rayCollision is StaticBody2D or rayCollision is Area2D or rayCollision is CharacterBody2D and (rayCollision.is_in_group("Wall") or rayCollision.is_in_group("Enemy")):
		## Inverte a direção em caso de colisão com parede ou inimigo
		#direcao = direcao * -1
		#animation.scale.x = animation.scale.x * -1
		#ray.scale.x = ray.scale.x * -1 
		#velocity.x = SPEED * direcao
	#else:
		#isAtak = false
		#collisionp = false
		
	
	
