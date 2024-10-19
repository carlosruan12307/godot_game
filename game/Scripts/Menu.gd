extends Node2D

const phases = PhasesStates.Phases

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void: PhasesStates.setSceneSelected(phases.FIRST_PHASE)


func _on_options_button_pressed() -> void:
	#TODO
	print("Botao de options iniciado")
	pass # Replace with function body.


func _on_botao_historico_button_pressed() -> void:
	#TODO
	print("Botao de historico iniciado")
	pass # Replace with function body.
	
	
