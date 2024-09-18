extends State 

class_name Jump
@onready var inputHandle = $"../Input"
@onready var player = $"../.."
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
# Called when the node enters the scene tree for the first time.
const JUMP_VELOCITY = -700.0
var jump_started = false
func Enter():
	player.velocity.x = 0
	animation.play("jump")
	await get_tree().create_timer(.5).timeout
	player.velocity.y = JUMP_VELOCITY

	jump_started = true
	
	pass
func Exit():
	pass
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func process_state(delta: float) -> void:
	inputHandle.inputHandlez(self,transitioned,"","","","")
	if Input.is_action_pressed("Z") and jump_started:
		
		transitioned.emit(self,"atack")
	if player.is_on_floor() and  jump_started:
		jump_started = false
		transitioned.emit(self,"idle")
	#if player.is_on_floor()  and jump_started:
		#jump_started = false
		#transitioned.emit(self,"idle")
	#if Input.is_action_pressed("Z"):
#
		#animation.play("air_atack")
		#transitioned.emit(self,"idle")
	pass
func physics_process_state(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass