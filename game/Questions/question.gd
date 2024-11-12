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

	
var perguntaAtual: PoolDePerguntas.QuestionClass

func _ready() -> void:
	perguntaAtual = PoolDePerguntas.getPerguntaRandomizada()
	print("Resposta correta: ", perguntaAtual.is_pergunta_correta())
	setPerguntaLabel(perguntaAtual.get_pergunta())
	pass 

func setPerguntaLabel(texto: String) -> void:
	LabelPergunta.text = texto

	
func handleButtonRespostaPressed(is_active: bool, nomeBotaoPressionado: String):
	var respondeuCorretamente: bool = perguntaAtual.is_pergunta_correta() == is_active

	#print("Valor pressionado: ", is_active)
	#print("Valor correto da pergunta: ", perguntaAtual.is_pergunta_correta())
	#print("Resultado:  ", respondeuCorretamente)

	#Muda a cor do botão pressionado
	var botaoPressionado = hideBottaoPressionado(nomeBotaoPressionado)
	botaoPressionado.modulate = hideGetCollorButton(respondeuCorretamente)

	await get_tree().create_timer(3.0).timeout
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
	print("Nome do botao pressionado: ", nomeBotaoAtual)
	match nomeBotaoAtual:
		"BotaoVerdadeiro": return BotaoVerdadeiro
		"BotaoFalso": return BotaoFalso
	
	
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
				PhasesStates.Phases.FIRST_PHASE:
					giveDebuffFisrtPhase()
				PhasesStates.Phases.SECOND_PHASE:
					giveDebuffSecondPhase()
					
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
	get_tree().paused = false
	queue_free()
	
func giveDebuffSecondPhase() -> void:
	get_tree().paused = false
	queue_free()
	var spawnRandom = randomBowSpawn()
	#bow.queue_free()
	bow.lastSpawn = spawnRandom.global_position
		
	bow.global_position = spawnRandom.global_position

func randomBowSpawn() -> Node:
	var random_child: Node
	while true:
		var random_index = randi() % SpawnBow.get_child_count()
		random_child = SpawnBow.get_child(random_index)
		
		# Verifica se a posição é diferente da última posição de spawn
		if random_child.global_position != bow.lastSpawn:
			break  # Sai do loop se encontrar uma posição válida
			
	return random_child
