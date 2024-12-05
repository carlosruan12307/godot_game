extends Node

var historico_partidass: Array[PartidaResultadoFinal] = []
var partida_atual: Array[PerguntaRespondida] = [] #Estrutura de dados LIFO
var GERAR_INFORMACOES_PARTIDA: CalcularInformacoes = CalcularInformacoes.new() 

func salvarNovoHistorico(novoHistorico: PartidaResultadoFinal):
		PerguntasUtil.historico_partidass.insert(0, novoHistorico)


func HandleFimDoJogo() -> void:
	PhasesStates.comeBackPrincipallMenu()
	
	var novoHistorico = PerguntasUtil.PartidaResultadoFinal.new(
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.countScore(),
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.countQntPartidasCorretas(),
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.countQntTempoRespondendo(),
			PerguntasUtil.GERAR_INFORMACOES_PARTIDA.stringProporcaoPerguntas()
	)
	
	PerguntasUtil.salvarNovoHistorico(novoHistorico)

##Classe para armazenar informacoes de partida
class PartidaResultadoFinal:
	var pontuacaoTotal: int
	var acertos: int
	var tempoTotalRespondendo: float
	var stringProporcaoAcerto: String
	
	func _init(
		_pontuacaoTotal: int = 0, 
		_acertos: int = 0,
		_tempoTotalRespondendo: float = 0.0, _stringProporcaoAcerto: String = ""):
			
			pontuacaoTotal = _pontuacaoTotal
			acertos = _acertos
			tempoTotalRespondendo = _tempoTotalRespondendo
			stringProporcaoAcerto = _stringProporcaoAcerto
			
			
class PerguntaRespondida:
	var score: int
	var acertou: bool
	var tempoDeResposta: float
	
	func _init(
		_score: int = 0, 
		_acertou: bool = false,
		_tempoDeResposta: float = 0.0):
			
			score = _score
			acertou = _acertou
			tempoDeResposta = _tempoDeResposta
			

##Classe para calcular as informacoes da partida
class CalcularInformacoes:
	const TAMANHO_HISTORICO: int = 5
	
	func countQntTempoRespondendo(perguntasJogadas: Array[PerguntaRespondida] = PerguntasUtil.partida_atual) -> int:
		var count: float = 0.0
		
		for pergunta in perguntasJogadas: count += pergunta.tempoDeResposta
		
		return count
		
	func countQntPartidasCorretas(perguntasJogadas: Array[PerguntaRespondida] = PerguntasUtil.partida_atual) -> int:
		var count: int = 0
		
		for pergunta in perguntasJogadas: 
			if pergunta.acertou: count += 1
		
		return count
		
	func stringProporcaoPerguntas() -> String:
		var partidasCorretas = countQntPartidasCorretas()
		var partidasJogadas = countQntPartidasJogadas()
		
		return partidasCorretas.str()+"/"+partidasJogadas.str()
		
	func countQntPartidasJogadas(perguntasJogadas: Array[PerguntaRespondida] = PerguntasUtil.partida_atual) -> int:
		
		return PerguntasUtil.partida_atual.size()
		
	func countScore(perguntasJogadas: Array[PerguntaRespondida] = PerguntasUtil.partida_atual) -> int:
		var total_score: int = 0
		
		for pergunta in perguntasJogadas: total_score += pergunta.score

		return total_score
		
	static func salvar_nova_pergunta_jogada(nova_pergunta_jogada):
		PerguntasUtil.partida_atual.insert(0, nova_pergunta_jogada)
	
	
	static func showHistorico() -> void:
		for item in PerguntasUtil.historico_partidass:
			if item is PartidaResultadoFinal:
				print("Acertos: ", item.acertos, 
					"Pontuação Total: ", item.pontuacaoTotal, 
					"Tempo Total Respondendo: ", item.tempoTotalRespondendo, 
					"Proporção Acertos: ", item.stringProporcaoAcerto)	
			
		
	static func showPartida() -> void:
		for item in PerguntasUtil.partida_atual:
			print("acertou: ", item.acertou, " score: ", item.score, " tempo: ", item.tempoDeResposta, "s")	
		
