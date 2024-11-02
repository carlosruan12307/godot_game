extends Node2D

@onready var question = preload("res://question.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
			# Instanciar a cena
	#var instance = question.instantiate()
	#
	## Posicionar a cena no topo da tela
	## Aqui consideramos a posição (x, y), onde x é a posição horizontal e y é a altura do topo
	#instance.position = Vector2(get_viewport().size.x / 2, 0)  # Centraliza horizontalmente no topo

	# Adiciona a instância como um filho do nó atual
	#add_child(instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
