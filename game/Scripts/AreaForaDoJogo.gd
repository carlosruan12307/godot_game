extends Node

const phases = PhasesStates.Phases
	
func _ready() -> void: pass 

func _process(delta: float) -> void: pass

func goToNextArea(body: Node2D) -> void:
	if PlayerStatus.thisBodyIsPlayer(body): handleNextPhase(PhasesStates.currentPhase)
	

func handleNextPhase(currentPhase) -> void:
	match currentPhase:
		phases.FIRST_PHASE: PhasesStates.setNextScene(phases.SECOND_PHASE)
		phases.SECOND_PHASE: PhasesStates.setNextScene(phases.THIRD_PHASE)
		phases.THIRD_PHASE: PhasesStates.setNextScene(phases.BOSS_PHASE)
			
