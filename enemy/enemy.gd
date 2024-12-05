extends CharacterBody2D

var direcao = -1
@export var distancia : int # Distância máxima que o personagem pode percorrer
var pump = 0.01
const JUMP_VELOCITY = -400.0
var first = true
var isAtak = false
var Hit = 1

@onready var state= %StateMachineEnemy
@onready var colli = $CollisionPolygon2D
@onready var sprite =  $Sprite2D
@onready var lifeEnemy = %ProgressBar
@onready var animation  = $Sprite2D/AnimatedSprite2D
@onready var ray = $RayCast2D
@onready var playerAnimation = get_node("../../Player/Sprite2D/AnimatedSprite2D")
@onready var lifePlayer = get_node("../../Player/ProgressBar")
var timeBeetweenDamage = 40

var previous_normal = Vector2.UP  # Normal padrão
var timeDamage = 0;
@export var SPEED = 0

var initial_position = Vector2.ZERO  # Posição inicial do personagem

func _ready() -> void:
	 # Salva a posição inicial
	ray.enabled = true
	

func _physics_process(delta: float) -> void:
	if lifeEnemy.value == 0:
		lifeEnemy.value = 1
		state.current_state.transitioned.emit(state.current_state,"DeadEnemy")
	pass

		


func _on_animated_sprite_2d_animation_finished() -> void:
	pass # Replace with function body.
