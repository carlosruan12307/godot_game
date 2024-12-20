extends Node2D
@onready var audio_click_player = $AudioStreamPlayer2D

const phases = PhasesStates.Phases

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void: 
	audio_click_player.play()
	await get_tree().create_timer(0.5).timeout
	PhasesStates.setSceneSelected(phases.INTRO_MENU)

func _on_options_button_pressed() -> void: 
	audio_click_player.play()
	await get_tree().create_timer(0.5).timeout
	PhasesStates.setSceneSelected(phases.OPTIONS_MENU)

func _on_botao_historico_button_pressed() -> void: 
	audio_click_player.play()
	await get_tree().create_timer(0.5).timeout
	PhasesStates.setSceneSelected(phases.RANKING_MENU)
	
