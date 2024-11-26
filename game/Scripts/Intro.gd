extends Node

var contadorClicksContinuar = 0
const limiteClicks = 2;

@onready var lorePt1Scene = $LoreTextPt1
@onready var lorePt2Scene = $LoreTextPt2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lorePt2Scene.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_continuar_pressed() -> void:
	contadorClicksContinuar += 1
	
	if(contadorClicksContinuar == limiteClicks):
		PhasesStates.setNextScene(PhasesStates.Phases.FIRST_PHASE)
	else:
		lorePt1Scene.hide()
		lorePt2Scene.show()
		
	
