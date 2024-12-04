extends Node

var partida_atual: Array = []
var historico_partidas: Array = [] #Estrutura de dados LIFO
var GERAR_INFORMACOES_PARTIDA: CalcularInformacoes = CalcularInformacoes.new() 


##Classe para armazenar informacoes de partida
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
	
	func countQntTempoRespondendo(perguntasJogadas: Array) -> int:
		var count: float = 0.0
		
		for match in perguntasJogadas: count += match.tempoDeResposta
		
		return count
		
	func countScore(perguntasJogadas: Array) -> int:
		var total_score: int = 0
		
		for match in perguntasJogadas: total_score += match.score

		return total_score
		
	func save_new_matc(new_match):
		PerguntasUtil.historico_partidas.insert(0, new_match)
	
		
	func get_history() -> Array:
		return PerguntasUtil.historico_partidas
