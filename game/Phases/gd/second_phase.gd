extends Node2D

@onready var question = preload("res://game/Questions/question.tscn")
@onready var bow = get_node("Bow")
@onready var marker = get_node("BowSpawn/Marker2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bow.position = marker.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
