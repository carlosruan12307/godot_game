extends StaticBody2D

@onready var ShaderRect = get_node("../ColorRect")
@onready var bowAim = get_node("../BowAim")
@onready var player = get_node("../Player")
@onready var bow = get_node("../Bow")
var aumentarRaio = 0.23
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("acertou")
	bowAim.global_position = player.global_position
	ShaderRect.material.set_shader_parameter("raio", aumentarRaio)
	get_tree().paused = false
	queue_free()
	bow.queue_free()
	pass # Replace with function body.
