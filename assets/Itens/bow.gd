extends StaticBody2D

@onready var question = preload("res://question.tscn")

@onready var phase = get_node("../")
var oneTime = true;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	#print(phase)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if oneTime:
				## Instanciar a cena
			var instance = question.instantiate()
			instance.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
			
			phase.add_child(instance)
			oneTime = false
			get_tree().paused = true
			
	pass # Replace with function body.
