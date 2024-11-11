extends Node


const Phases = {
	"FIRST_PHASE" : {"PATH": "res://game/Phases/FirstPhase.tscn"},
	"SECOND_PHASE" : {"PATH": "res://game/Phases/SecondPhase.tscn"},
	"THIRD_PHASE" : {"PATH": "res://game/Phases/ThirdPhase.tscn"},
	"OPTIONS_MENU": {"PATH": "res://game/Menus/OptionsMenu.tscn"},
	"RANKING_MENU": {"PATH": "res://game/Menus/RankingMenu.tscn"},
	"PRINCIPAL_MENU": {"PATH": "res://game/Menus/PrincipalMenu.tscn"},
	"BOSS_PHASE" : {"PATH": "TODO"}
}

var currentPhase = Phases.SECOND_PHASE
var LifeBefore = 0
func setSceneSelected(phase) -> void: get_tree().change_scene_to_file(phase.PATH)
	
func comeBackPrincipallMenu(): setSceneSelected(Phases.PRINCIPAL_MENU)

func setNextScene(nextPhase) -> void: 
	if(!nextPhase.PATH== 'TODO'): 
		LifeBefore = get_tree().get_nodes_in_group("Player")[0].get_node("Life/LifeBarChanged/ProgressBarPlayer").value
		currentPhase = nextPhase
		get_tree().change_scene_to_file(nextPhase.PATH)
		
	else :
		var comeBackToFirstPhase =  Phases.FIRST_PHASE
		currentPhase = comeBackToFirstPhase
		get_tree().change_scene_to_file(comeBackToFirstPhase.PATH)
