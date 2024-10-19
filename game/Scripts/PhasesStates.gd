extends Node


const Phases = {
	"FIRST_PHASE" : {"PATH": "res://game/Phases/FirstPhase.tscn"},
	"SECOND_PHASE" : {"PATH": "res://game/Phases/SecondPhase.tscn"},
	"THIRD_PHASE" : {"PATH": "res://game/Phases/ThirdPhase.tscn"},
	"BOSS_PHASE" : {"PATH": "TODO"}
}

var currentPhase = Phases.FIRST_PHASE

func setSceneSelected(phase) -> void: get_tree().change_scene_to_file(phase.PATH)

func setNextScene(nextPhase) -> void: 
	if(!nextPhase.PATH== 'TODO'): 
		currentPhase = nextPhase
		get_tree().change_scene_to_file(nextPhase.PATH)
		
	else :
		var comeBackToFirstPhase =  Phases.FIRST_PHASE
		currentPhase = comeBackToFirstPhase
		get_tree().change_scene_to_file(comeBackToFirstPhase.PATH)
