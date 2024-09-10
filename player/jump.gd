extends State 

class_name Jump
@onready var inputHandle = $"../Input"
@onready var player = $"../.."
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
# Called when the node enters the scene tree for the first time.
const JUMP_VELOCITY = -400.0
func Enter():
	
	animation.play("jump")
	await get_tree().create_timer(.5).timeout
	player.velocity.y = JUMP_VELOCITY
	print(player.velocity)
	transitioned.emit(self,"idle")
	pass
func Exit():
	pass
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func process_state(delta: float) -> void: 
	pass
func physics_process_state(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	inputHandle.inputHandlez(self,transitioned,"jump","","")
	pass
