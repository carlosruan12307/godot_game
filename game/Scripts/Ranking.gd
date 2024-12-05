extends Node2D
@onready var audio_click_player = $AudioStreamPlayer2D
@onready var labelHistorico =$RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var historicoString = PerguntasUtil.CalcularInformacoes.showHistorico()
	
	labelHistorico.text = historicoString
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_voltar_button_pressed() -> void: 
	audio_click_player.play()
	await get_tree().create_timer(0.5).timeout
	PhasesStates.comeBackPrincipallMenu()
