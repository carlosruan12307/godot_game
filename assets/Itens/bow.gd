extends StaticBody2D

@onready var question = preload("res://game/Questions/question.tscn")

@onready var phase = get_node("../")
var oneTime = true;
@export var lastSpawn  : Vector2 = Vector2(0,0);


func _ready() -> void:
	lastSpawn = global_position
	pass 


func _process(delta: float) -> void:

	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
				## Instanciar a cena
	var instance = question.instantiate()
	instance.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
			
	phase.add_child(instance)
	oneTime = false
	get_tree().paused = true
			
	pass # Replace with function body.
