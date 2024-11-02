extends StaticBody2D

var pressedC = false
var aimEnterEnemy = false
@onready var LifeBarNecro = get_node("../EnemyNecro/Life/LifeBarChanged/ProgressBarNecro")
@onready var LifeBarNecroLabel = get_node("../EnemyNecro/Life/LifeBarChanged/Label")
var notkeys = true;
@onready var playerStateMachine =  get_node("../Player/State Machine")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerStateMachine != null:
		#if Input.is_action_just_pressed("C"):
			#notkeys = true;
		if Input.is_action_pressed("W"):
			global_position.y = global_position.y - 5;
			notkeys = false;
		if Input.is_action_pressed("S"):
			global_position.y = global_position.y + 5;
			notkeys = false;
		if Input.is_action_pressed("A"):
			global_position.x = global_position.x - 5;
			notkeys = false;
		if Input.is_action_pressed("D"):
			global_position.x = global_position.x + 5;
			notkeys = false;	
		#if (Input.is_action_just_pressed("C") or pressedC) and notkeys:
			#global_position = get_viewport().get_mouse_position()
			#pressedC = true
		#if Input.is_action_just_pressed("Mouse_Left_Click") and aimEnterEnemy:
			#playerStateMachine.current_state.transitioned.emit(playerStateMachine.current_state,"AtackBow")
			#LifeBarNecro.value -= 15
			#LifeBarNecroLabel.text = str(LifeBarNecro.value) + "/100"
		if Input.is_action_just_pressed("Q") and aimEnterEnemy:
			playerStateMachine.current_state.transitioned.emit(playerStateMachine.current_state,"AtackBow")
			LifeBarNecro.value -= 15
			LifeBarNecroLabel.text = str(LifeBarNecro.value) + "/100"

	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy_Necro"):
		aimEnterEnemy = true

	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	aimEnterEnemy = false
	pass # Replace with function body.
