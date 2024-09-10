extends State

class_name Idle
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var player = $"../.."
@onready var sprite = $"../../Sprite2D"
@onready var inputHandle = $"../Input"
const SPEED = 300.0
# Called when the node enters the scene tree for the first time.
func Enter():
	animation.play("idle")
	pass
func Exit():
	pass
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func process_state(delta: float) -> void:
	inputHandle.inputHandlez(self,transitioned,"jump","run","run","atack")
	pass
func physics_process_state(delta: float) -> void:
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass
