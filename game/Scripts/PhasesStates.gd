extends Node


const Phases = {
	"FIRST_PHASE" : {"PATH": "res://game/Phases/FirstPhase.tscn"},
	"SECOND_PHASE" : {"PATH": "res://game/Phases/SecondPhase.tscn"},
	"THIRD_PHASE" : {"PATH": "res://game/Phases/ThirdPhase.tscn"},
	"BOSS_PHASE" : {"PATH": "TODO"}
}

var currentPhase = Phases.FIRST_PHASE
