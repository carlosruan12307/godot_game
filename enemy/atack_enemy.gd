extends StateEnemy

class_name AtackEnemy
@onready var ray = $"../../RayCast2D"
var direcao = -1
@onready var enemy = $"../.."
@onready var animation = $"../../Sprite2D/AnimatedSprite2D"
var timeDamage = 0;
var timeBeetweenDamage = 40
@onready var lifePlayer = get_node("../../../Player/ProgressBarPlayer")
@onready var TextLife = get_node("../../../Player/Label")
@onready var player = get_node("../../../Player")
@onready var statePlayer = get_node("../../../Player/State Machine")
@onready var playerAnimation = get_node("../../../Player/Sprite2D/AnimatedSprite2D")
var initial_position = 0;
var previous_normal = Vector2.UP;
# Called when the node enters the scene tree for the first time.
func Enter():
	animation.play("atack1")
	pass
func Exit():
	pass
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func process_state(delta: float) -> void:
	var rayCollision = ray.get_collider()
	if rayCollision is Node and rayCollision.is_in_group("Player"):	
		#enemy.collisionp = true
		#if playerAnimation.animation == "atack_1":
		timeDamage += 1;
		if timeDamage >= timeBeetweenDamage:
			timeDamage = 0
			lifePlayer.value = lifePlayer.value - 10
			TextLife.text = str(lifePlayer.value) + "/100"
			if statePlayer != null:
				statePlayer.current_state.transitioned.emit(statePlayer.current_state,"Hurt")
	else:
		transitioned.emit(self,"WalkEnemy")

	
		
	

	pass
func physics_process_state(delta: float) -> void:
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass
