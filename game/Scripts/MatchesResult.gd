extends Node

var matches_played_global: Array = []
var last_matches_global: Array = [] #Estrutura de dados LIFO
var calculateResultsOfRaking: MatchStatistics = MatchStatistics.new() 

##Classe para armazenar informacoes de partida
class MatchedPlayed:
	var qntPerguntasCorretas: int
	var score: int
	var hasWon: bool
	var tempoDePartida: float
	
	func _init(
		_qntPerguntasCorretas: int = 0, 
		_score: int = 0, 
		_hasWon: bool = false,
		_tempoDePartida: float = 0.0):
			
			qntPerguntasCorretas = _qntPerguntasCorretas
			score = _score
			hasWon = _hasWon
			tempoDePartida = _tempoDePartida
			

##Classe para calcular as informacoes da partida
class MatchStatistics:
	const HISTORY_SIZE: int = 5
	
	func countQntPerguntasCorretas(matches_played_global: Array) -> int:
		var count: int = 0
		
		for match in matches_played_global:
			if match.qntPerguntasCorretas: count += 1
		return count
		
	func count_score(matches_played_global: Array) -> int:
		var total_score: int = 0
		
		for match in matches_played_global: total_score += match.score

		return total_score
		
	func matches_played(matches_played_global: Array) -> int:
		return matches_played_global.size()
		
	func save_new_matc(new_match):
		MatchesResult.last_matches_global.insert(0, new_match)
	
			
	func get_history() -> Array:
		return MatchesResult.last_scores_global
