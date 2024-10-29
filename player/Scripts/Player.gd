extends CharacterBody2D
var previous_normal = Vector2.UP  # Normal padrão
const GRAVITY = 1000.0  # Valor da gravidade
const SLIDE_FACTOR = 5000.0  # Controla a velocidade do deslizamento
const SPEED = 200.0  # Velocidade de movimentação no chão
@onready var lightningAnimation = $"../StaticBody2D/Sprite2D2/lightning"
@onready var lightning = $"../StaticBody2D/Sprite2D2"
@onready var collisionLight = $"../StaticBody2D/CollisionShape2D"
var timeLightningTwo = 0;
var timeLightningFinal = 0;
var randomLightning = 1

func _ready() -> void:

		scale = Vector2(3,3)

func _process(delta: float) -> void:

	
	if position.y <= 280 and is_on_floor():
		lightningAnimation.visible = true
		lightning.visible = true
		collisionLight.visible = true
		timeLightningTwo += 1;
		timeLightningFinal += 1;
		if timeLightningTwo >= 60:
			timeLightningTwo = 0;
			
			lightningAnimation.position.x = position.x - ( 100 * randomLightning);
			lightningAnimation.position.y = position.y - 90
			collisionLight.position.x = position.x  -(100 * randomLightning);
			collisionLight.position.y = position.y - 90
			randomLightning = randomLightning * -1
			lightningAnimation.play("default")
		if timeLightningFinal >= 900:
			timeLightningFinal = 0;
			lightningAnimation.position.x = position.x 
			lightningAnimation.position.y = position.y -90
			collisionLight.position.x = position.x 
			collisionLight.position.y = position.y -90
			randomLightning = randomLightning * -1
			lightningAnimation.play("default")
	elif is_on_floor():
		lightningAnimation.visible = false
		lightning.visible = false
		collisionLight.visible = false
	#for i in range(get_slide_collision_count()):
		#var collision = get_slide_collision(i)
		#if collision:
			#print("Colidiu com: ", collision.get_collider())
	pass

func _physics_process(delta: float) -> void:
	## Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
				# Se estiver no chão, aplica um fator de deslizamento na direção da inclinação
		var floor_normal = get_floor_normal()
		if abs(velocity.x) > 0.1:
			velocity.x += floor_normal.x * SLIDE_FACTOR * delta  # Aplica o deslizamento
	move_and_slide()
# Obtém a normal do chão
	var normal = get_floor_normal()

	# Interpolação suave entre a normal anterior e a nova normal
	normal = previous_normal.lerp(normal, 0.1)

	# Ajusta a rotação com base na normal interpolada
	var angle = normal.angle_to(Vector2.UP)
	rotation = -angle

	# Atualiza a normal anterior
	previous_normal = normal


func _on_static_body_2d_body_entered(body: Node2D) -> void:
	print("entrou")
	pass # Replace with function body.
