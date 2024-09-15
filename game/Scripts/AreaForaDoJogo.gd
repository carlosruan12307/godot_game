extends Node

func _ready() -> void: pass 

func _process(delta: float) -> void: pass

func goToNextArea(body: Node2D) -> void:
	if PlayerStatus.thisBodyIsPlayer(body): handleNextPhase(PhasesStates.currentPhase)
	

func handleNextPhase(currentPhase) -> void:
	const phases = PhasesStates.Phases
	
	match currentPhase:
		phases.FIRST_PHASE: setNextScene(phases.SECOND_PHASE)
		phases.SECOND_PHASE: setNextScene(phases.THIRD_PHASE)
		phases.THIRD_PHASE: setNextScene(phases.BOSS_PHASE)
			
func setNextScene(nextPhase) -> void: 
	if(!nextPhase.PATH== 'TODO'): 
		PhasesStates.currentPhase = nextPhase
		get_tree().change_scene_to_file(nextPhase.PATH)
		
	else :
		var comeBackToFirstPhase =  PhasesStates.Phases.FIRST_PHASE
		PhasesStates.currentPhase = comeBackToFirstPhase
		get_tree().change_scene_to_file(comeBackToFirstPhase.PATH)
