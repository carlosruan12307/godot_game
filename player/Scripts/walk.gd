extends State 

class_name Walk
@onready var player = $"../.."
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
@onready var inputHandle = $"../Input"
# Called when the node enters the scene tree for the first time.
func Enter():
	if animation.animation != "air_atack":
		animation.play("run")
	elif player.velocity.y == 0:
		animation.play("run")
	pass
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func process_state(delta: float) -> void:
	if animation.animation != "air_atack":
		inputHandle.inputHandlez(self,transitioned,"jump","run","run","")
	else:
		inputHandle.inputHandlez(self,transitioned,"","run","run","")
	if player.velocity == Vector2.ZERO :
		transitioned.emit(self,"idle")
	pass
func physics_process_state(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass