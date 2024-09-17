extends CharacterBody2D

var direcao = 1
var distancia = 600
var pump = 0.01
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var first = true
@onready var colli = $CollisionPolygon2D
@onready var sprite =  $Sprite2D
@onready var animation  = $Sprite2D/AnimatedSprite2D
var previous_normal = Vector2.UP  # Normal padrão
func _ready() -> void:
	animation.play("walk")
func _physics_process(delta: float) -> void:
	if  direcao == distancia or direcao < 0:
		if first:
			pump = pump / 10
			first = false;
		sprite.scale.x = -1
		colli.scale.x = -1
		velocity.x = 30 * pump
		direcao += 1
		pump = pump + 0.01
	elif direcao <= distancia and direcao >= 0:
		if first:
			pump = pump / 10
			first = false;
		sprite.scale.x = 1
		colli.scale.x = 1
		velocity.x = -30  * pump
		direcao += 1
		pump = pump + 0.01
		if direcao == distancia:
			direcao = direcao * -1
		#



	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#for i in range(get_slide_collision_count()):
		#var collision = get_slide_collision(i)
		#if collision.get_collider().is_in_group("Player"):
			#print("Colidiu com: ", collision.get_collider())

	move_and_slide()
# Obtém a normal do chão
	var normal = get_floor_normal()

	# Interpolação suave entre a normal anterior e a nova normal
	normal = previous_normal.lerp(normal, 0.07)

	# Ajusta a rotação com base na normal interpolada
	var angle = normal.angle_to(Vector2.UP)
	rotation = -angle

	# Atualiza a normal anterior
	previous_normal = normal
