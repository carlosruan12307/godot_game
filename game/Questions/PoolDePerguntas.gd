extends Node

const QUANTIDADE_PERGUNTAS_RETORNADAS_ATUALMENTE: int = 10
const ARRAY_PERGUNTAS_REPETIDAS: Array = []

func getPerguntaRandomizada() -> QuestionClass:
	if Perguntas.has(TEMA_ATUAL):
		var novaPergunta = getRandomSubset(Perguntas[TEMA_ATUAL])[QUANTIDADE_PERGUNTAS_RETORNADAS_ATUALMENTE-1]
		
		if !ARRAY_PERGUNTAS_REPETIDAS.has(novaPergunta):
			ARRAY_PERGUNTAS_REPETIDAS.append(novaPergunta)
			return novaPergunta
		else:
			return getPerguntaRandomizada() 
	else:
		print("Tema atual não encontrado em Perguntas")
		return null


	
func setTemaAtual(tema: TEMA) -> void: TEMA_ATUAL = tema
	
func getRandomSubset(array: Array) -> Array:
	if array.size() <= QUANTIDADE_PERGUNTAS_RETORNADAS_ATUALMENTE: return array 
	 
	return getRandomArray(array).slice(0, QUANTIDADE_PERGUNTAS_RETORNADAS_ATUALMENTE)  

func getRandomArray(array: Array) -> Array:
	var shuffled_array = array.duplicate() 
	shuffled_array.shuffle()  
	return shuffled_array  

var TEMA_ATUAL: TEMA = TEMA.ESTRUTURA_DE_DADOS

# Definindo enums 
enum TEMA{
	ESTRUTURA_DE_DADOS, 
	PROGRAMACAO_ORIENTADA_OBJETOS
}

enum PESO_PERGUNTA{
	FACIL,
	MEDIO,
	DIFICIL
}

# Classe de uma pergunta
class QuestionClass:	
	var pergunta: String
	var peso: PESO_PERGUNTA
	var is_true: bool
	
	func _init(new_pergunta: String, new_is_true: bool, new_peso: PESO_PERGUNTA):
		pergunta = new_pergunta
		is_true = new_is_true
		peso = new_peso

	func get_pergunta() -> String: return pergunta

	func get_peso(): return peso
		
	func is_pergunta_correta() -> bool: return is_true

# Estrutura de Dados - Perguntas fáceis
var Perguntas: Dictionary = {
	TEMA.ESTRUTURA_DE_DADOS: [
		QuestionClass.new("Uma pilha funciona no modo FIFO (First In, First Out)?", false, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Uma fila insere elementos no final e remove do início?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Um array é uma estrutura de dados de tamanho fixo?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("A lista ligada possui uma estrutura de alocação contínua na memória?", false, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Em uma lista duplamente ligada, cada nó possui dois ponteiros?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Uma árvore binária pode ter no máximo dois filhos por nó?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Em uma árvore binária de busca, o valor do nó esquerdo é sempre menor que o nó raiz?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Em uma fila circular, o último elemento está conectado ao primeiro?", true, PESO_PERGUNTA.FACIL),

	# Estrutura de Dados - Perguntas médias
		QuestionClass.new("Uma árvore AVL é uma árvore binária de busca balanceada?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("O método de ordenação QuickSort utiliza a abordagem de dividir para conquistar?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("HeapSort é uma técnica de ordenação que utiliza uma árvore de pesquisa binária?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Em uma lista duplamente ligada, o último elemento sempre aponta para o primeiro?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Uma árvore binária completa é aquela em que todos os nós têm zero ou dois filhos?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Em uma árvore binária de busca, a busca tem complexidade média O(log n)?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Uma fila de prioridade utiliza uma estrutura de dados do tipo heap?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("O grafo completo é aquele onde todos os vértices estão conectados?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("No algoritmo BFS (Busca em Largura), a busca segue um caminho até o final antes de retroceder?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("O algoritmo de Kruskal é usado para encontrar a árvore geradora mínima de um grafo?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("A pesquisa binária é eficiente em listas não ordenadas?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("O algoritmo de Dijkstra encontra o caminho mais curto em grafos direcionados com pesos negativos?", false, PESO_PERGUNTA.MEDIO),

	# Estrutura de Dados - Perguntas difíceis
		QuestionClass.new("Um heap mínimo garante que o menor elemento está sempre na raiz?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Em uma árvore B, todos os nós folha estão no mesmo nível?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Em um grafo acíclico, o número de arestas é sempre igual ao número de vértices menos um?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O algoritmo de Floyd-Warshall calcula o caminho mais longo entre todos os pares de vértices?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O algoritmo Bellman-Ford é mais eficiente que o Dijkstra para grafos com arestas negativas?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("No algoritmo de Prim, a árvore geradora mínima é formada por seleção de vértices com menor custo?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Em uma árvore AVL, o balanceamento de altura nunca excede 1 para qualquer nó?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O algoritmo A* é um exemplo de busca heurística em grafos?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O tempo médio de acesso a elementos em uma tabela hash com hash perfeito é O(1)?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O grafo bipartido completo possui um número par de vértices?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("A complexidade do algoritmo Merge Sort é O(n^2)?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("A árvore vermelho-preto é uma árvore AVL?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O algoritmo de Edmonds-Karp é uma implementação do algoritmo de fluxo máximo?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Em um heap binário, todos os nós têm no máximo dois filhos?", true, PESO_PERGUNTA.DIFICIL)
	],

	# Programação Orientada a Objetos - Perguntas fáceis
	TEMA.PROGRAMACAO_ORIENTADA_OBJETOS: [
		QuestionClass.new("A herança permite que uma classe herde atributos de outra?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Em POO, um objeto é uma instância de uma classe?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Encapsulamento é o conceito de esconder detalhes internos de uma classe?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Um método estático é chamado diretamente pela classe, sem instância?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Polimorfismo permite que métodos tenham o mesmo nome, mas comportamentos diferentes?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("A sobrecarga de métodos permite várias implementações de um mesmo método em uma classe?", true, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Interfaces em POO são classes abstratas que podem ter métodos implementados?", false, PESO_PERGUNTA.FACIL),
		QuestionClass.new("Em POO, a composição é uma forma de criar objetos com base em outros objetos?", true, PESO_PERGUNTA.FACIL),

	# Programação Orientada a Objetos - Perguntas médias
		QuestionClass.new("O polimorfismo dinâmico ocorre em tempo de compilação?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Um método abstrato não possui implementação na classe base?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Na composição, os objetos componentes podem existir independentemente do objeto composto?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("A sobrecarga de operadores é uma forma de polimorfismo?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Uma classe final pode ser herdada em Java?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Em C++, um destrutor é executado automaticamente quando um objeto é removido?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("O encapsulamento é uma forma de controlar o acesso aos atributos de uma classe?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("A associação é um relacionamento entre classes que implica na existência de ambas?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Uma classe abstrata pode ter métodos implementados?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("O princípio DRY recomenda duplicar código para maior clareza?", false, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Um método final não pode ser sobrescrito em subclasses?", true, PESO_PERGUNTA.MEDIO),
		QuestionClass.new("Em Java, um construtor privado impede que a classe seja instanciada fora dela?", true, PESO_PERGUNTA.MEDIO),

	# Programação Orientada a Objetos - Perguntas difíceis
		QuestionClass.new("O princípio Liskov substitui o conceito de polimorfismo em POO?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O padrão de projeto Singleton garante que uma classe tenha uma única instância?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O acoplamento fraco é preferível em design de classes?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O padrão Adapter converte a interface de uma classe em outra interface esperada?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Interfaces e classes abstratas são equivalentes em C#?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O princípio SOLID recomenda a violação de responsabilidades para ganhar eficiência?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("A inversão de controle é a prática de evitar dependências concretas em código?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O padrão Observer permite que objetos observem mudanças em outros objetos?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Em POO, o polimorfismo de inclusão permite que subclasses sejam tratadas como a classe base?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O padrão de projeto Factory é um exemplo de encapsulamento de criação?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("A responsabilidade única significa que uma classe deve ter apenas uma razão para mudar?", true, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("O princípio da segregação de interfaces sugere classes com muitas dependências?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Em Java, o polimorfismo de sobrecarga ocorre entre classes diferentes?", false, PESO_PERGUNTA.DIFICIL),
		QuestionClass.new("Em linguagens orientadas a objetos, a reflexão permite o acesso dinâmico a classes e métodos?", true, PESO_PERGUNTA.DIFICIL)
	]
}
