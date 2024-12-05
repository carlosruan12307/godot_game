extends CharacterBody2D

var previous_normal = Vector2.UP  # Normal padrão
const GRAVITY = 1000.0  # Valor da gravidade
const SLIDE_FACTOR = 5000.0  # Controla a velocidade do deslizamento
const SPEED = 200.0  # Velocidade de movimentação no chão
@onready var state = $"State Machine"
@onready var lightningAnimation = $"../StaticBody2D/Sprite2D2/lightning"
@onready var lightning = $"../StaticBody2D"
@onready var progressBarLifeGain = get_node("../ProgressBarSlimes")
@onready var area2dLightning  = $"../StaticBody2D/Area2D"
@onready var collisionPlayer = $CollisionPolygon2D
@onready var collisionLight = $"../StaticBody2D/CollisionShape2D"
@onready var lightningRay = $"../StaticBody2D/Sprite2D2/RayCast2D"
@onready var animationP = $Sprite2D/AnimatedSprite2D
@onready var lifeBar = %ProgressBarPlayer
@onready var lifeBarLabel = %Label
@onready var bowAim = get_node("../BowAim")
@onready var endgame = preload("res://game/Phases/scenes/end_game.tscn")
@onready var currentPhase = get_node("../")
@onready var ray = %RayCast2D
@onready var phase = get_node("../")
@onready var ShaderRect = $"../ColorRect"
@onready var question = preload("res://game/Questions/question.tscn")
var timeLightningTwo = 0
var timeLightningFinal = 0
var randomLightning = 1
var pushX = 0
var pushY = 0
var oneTimeQuestion = true

func _ready() -> void:
	 # Converte a posição do personagem para coordenadas de tela normalizadas (UV)
	if PhasesStates.LifeBefore != 0:
		print(PhasesStates.LifeBefore)
		lifeBar.value = PhasesStates.LifeBefore
		lifeBarLabel.text = str(lifeBar.value) + "/100"
	ray.enabled = true
	scale = Vector2(3,3)
	#collisionLight.disabled = true  # Inicialmente, a colisão do raio está desativada

func handleMortePersonagem() -> void:
		rotation = 0
		animationP.play("dead")
		remove_from_group("Player")
		velocity = Vector2.ZERO
		
	
		if state !=null :
			state.queue_free()
			set_collision_layer_value(2,false)
			await get_tree().create_timer(2).timeout
			handleFimDoJogoMorreu()
		

func handleFimDoJogoMorreu() -> void:
	PhasesStates.LifeBefore = 0
	PhasesStates.comeBackPrincipallMenu()
	
	var novoHistorico = PerguntasUtil.PartidaResultadoFinal.new(
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.countScore(),
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.countQntPartidasCorretas(),
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.countQntTempoRespondendo(),
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.stringProporcaoPerguntas()
	)
	
	PerguntasUtil.salvarNovoHistorico(novoHistorico)
	PerguntasUtil.partida_atual = []	
func _process(delta: float) -> void:

	if progressBarLifeGain and progressBarLifeGain.value >= 1000 and oneTimeQuestion:
		var instance = question.instantiate()
		instance.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
		phase.add_child(instance)
		get_tree().paused = true
		#lifeBar.value = 100;
		#lifeBarLabel.text = str(lifeBar.value) + "/100"
		oneTimeQuestion = false;
	
	
	##QUANDO MORRE
	if lifeBar.value == 0 and animationP.animation != "dead": handleMortePersonagem()

		
	if position.y <= 280 and is_on_floor() and lightning:
		lightningAnimation.visible = true
		lightning.visible = true
		timeLightningTwo += 1
		timeLightningFinal += 1

		if timeLightningTwo >= 60:
			area2dLightning.monitoring = true
			rotation = 0
			timeLightningTwo = 0
			lightning.position.x = position.x - (100 * randomLightning)
			lightning.position.y = position.y - 200
			randomLightning = randomLightning * -1

			# Ativa a colisão do raio brevemente
			collisionLight.disabled = false
			lightningAnimation.play("default")

		if timeLightningFinal >= 900:
			timeLightningFinal = 0
			lightning.position.x = position.x
			lightning.position.y = position.y - 90
			randomLightning = randomLightning * -1

			# Ativa a colisão do raio brevemente
			collisionLight.disabled = false
			lightningAnimation.play("default")

	elif is_on_floor() and lightningAnimation:
		lightningAnimation.visible = false
		lightning.visible = false
		collisionLight.disabled = true  # Desativa a colisão quando o raio não está ativo

func _physics_process(delta: float) -> void:
	if ShaderRect != null:
		var player_screen_pos = get_global_position()
		var screen_size = get_viewport_rect().size

			#aumentarRaio = aumentarRaio + 0.4
			#pushY = pushY - 0.2

		ShaderRect.material.set_shader_parameter("centerX", player_screen_pos.x / screen_size.x + pushX)
	
		ShaderRect.material.set_shader_parameter("centerY", player_screen_pos.y / screen_size.y + pushY)
	## Adiciona gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		var floor_normal = get_floor_normal()
		if abs(velocity.x) > 0.1:
			velocity.x += floor_normal.x * SLIDE_FACTOR * delta  # Aplica o deslizamento

	var normal = get_floor_normal()
	normal = previous_normal.lerp(normal, 0.1)
	var angle = normal.angle_to(Vector2.UP)
	rotation = -angle
	previous_normal = normal
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Verifica se o corpo atingido é o personagem
	if body.is_in_group("Player"):  
		lifeBar.value -= 15
		lifeBarLabel.text = str(lifeBar.value) + "/100"
		if state !=null:
			state.current_state.transitioned.emit(state.current_state,"Hurt")

	# Desativa a colisão do raio logo após o impacto
	collisionLight.disabled = true
