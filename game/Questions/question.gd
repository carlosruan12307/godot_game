extends StaticBody2D

@onready var ShaderRect = get_node("../ColorRect")
@onready var bowAim = get_node("../BowAim")
@onready var player = get_node("../Player")
@onready var playerLifeBar = get_node("../Player/Life/LifeBarChanged/ProgressBarPlayer")
@onready var lifeBarLabel = get_node("../Player/Life/LifeBarChanged/Label")
@onready var bow = get_node("../Bow")
@onready var SpawnBow = get_node("../BowSpawn")
@onready var phase = get_node("../")
var oneTimeFirstPhase = true
@export var aumentarRaio = 0.23
@onready var LabelPergunta = $Container/GridContainer/Pergunta/PerguntaLabel
@onready var BotaoFalso  = $Container/GridContainer/DungeonBrickWallGrey_png/Falso
@onready var BotaoVerdadeiro = $Container/GridContainer/DungeonBrickWallGrey_png/Verdadeiro
@onready var COR_ORIGINAL_BOTAO = BotaoVerdadeiro.modulate 
@onready var labelTimer = $TimerLabel
@onready var clock_timer = $Timer
var perguntaAtual: PoolDePerguntas.QuestionClass
var tempo_decorrido: float = 0.0
var tempo_limite: float = 20.00
var epsilon: float = 0.01


func _ready() -> void:
	perguntaAtual = PoolDePerguntas.getPerguntaRandomizada()
	setPerguntaLabel(perguntaAtual.get_pergunta())
	_clock_start()
	
	print("Resposta correta: ", perguntaAtual.is_pergunta_correta())
	pass 
	  

func _process(delta: float) -> void:
	tempo_decorrido += delta
	
	if abs(tempo_decorrido - tempo_limite) < epsilon:
		hideGetCollorButton(false)
		executarAcaoRespostaErrada()
		
	_update_timer_label()

func _clock_start() -> void:
	tempo_decorrido = 0.0 
	clock_timer.start()

func _clock_stop_and_capture() -> float:
	clock_timer.stop()
	return tempo_decorrido
	
func calcular_score(
	tempo_decorrido: float = tempo_decorrido,
	limite_tempo: float = tempo_limite) -> int:
	
	var pontuacao_maxima: float = 500.0
	var pontuacao_minima: float = 1.0

	tempo_decorrido = clamp(tempo_decorrido, 0, limite_tempo)
	
	var pontuacao: float = pontuacao_maxima - ((pontuacao_maxima - pontuacao_minima) * (tempo_decorrido / limite_tempo))

	return int(round(pontuacao))

func _update_timer_label() -> void: labelTimer.text = "Tempo: " + str(tempo_decorrido).pad_decimals(2) + "s" 

func setPerguntaLabel(texto: String) -> void: LabelPergunta.text = texto
	

	
func handleButtonRespostaPressed(is_active: bool, nomeBotaoPressionado: String):
	var respondeuCorretamente: bool = perguntaAtual.is_pergunta_correta() == is_active
	var botaoPressionado = hideBottaoPressionado(nomeBotaoPressionado)
	
	botaoPressionado.modulate = hideGetCollorButton(respondeuCorretamente)
	
	#Registra pergunta feita
	var scoreObtido = 0 
	
	if respondeuCorretamente:
		scoreObtido = calcular_score()
		
	var novaQuestaoGerada: PerguntasUtil.PerguntaRespondida = PerguntasUtil.PerguntaRespondida.new(
		scoreObtido , respondeuCorretamente, tempo_decorrido
	)
	
	PerguntasUtil.CalcularInformacoes.salvar_nova_pergunta_jogada(novaQuestaoGerada)
	
	await get_tree().create_timer(2).timeout
	botaoPressionado.modulate = COR_ORIGINAL_BOTAO

	if respondeuCorretamente:
		executarAcaoRespostaCorreta()
	else:
		executarAcaoRespostaErrada()

func hideGetCollorButton(reslt: bool):
	const cor_verde = Color(0, 1, 0) 
	const cor_vermelha = Color(1, 0, 0)  	
	return cor_verde if reslt else cor_vermelha	

func hideBottaoPressionado(nomeBotaoAtual: String):
	match nomeBotaoAtual:
		"BotaoVerdadeiro":	return	BotaoVerdadeiro
		"BotaoFalso":	return	BotaoFalso
		
func executarAcaoRespostaCorreta() -> void:
	if phase != null:
		match PhasesStates.currentPhase:
			PhasesStates.Phases.FIRST_PHASE:
				giveBonusFirstPhase()
			PhasesStates.Phases.SECOND_PHASE:
				giveBonusSecondPhase()

func executarAcaoRespostaErrada() -> void:
	if phase != null:
		match PhasesStates.currentPhase:
			PhasesStates.Phases.FIRST_PHASE: giveDebuffFisrtPhase()
			PhasesStates.Phases.SECOND_PHASE:giveDebuffSecondPhase()
					
func giveBonusFirstPhase() -> void:
	playerLifeBar.value = 100;
	lifeBarLabel.text = str(playerLifeBar.value) + "/100"
	get_tree().paused = false
	queue_free()
	
func giveBonusSecondPhase() -> void:
	bowAim.global_position = player.global_position
	ShaderRect.material.set_shader_parameter("raio", aumentarRaio)
	get_tree().paused = false
	queue_free()
	bow.queue_free()
	
func giveDebuffFisrtPhase() -> void:
	PhasesStates.LifeBefore = playerLifeBar.value
	get_tree().paused = false
	queue_free()
	
func giveDebuffSecondPhase() -> void:
	get_tree().paused = false
	queue_free()
	var spawnRandom = randomBowSpawn()
	bow.lastSpawn = spawnRandom.global_position
	bow.global_position = spawnRandom.global_position

func randomBowSpawn() -> Node:
	var random_child: Node
	while true:
		var random_index = randi() % SpawnBow.get_child_count()
		random_child = SpawnBow.get_child(random_index)
		
		if random_child.global_position != bow.lastSpawn: break  
			
	return random_child
