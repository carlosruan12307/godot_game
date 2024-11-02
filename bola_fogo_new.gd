extends CharacterBody2D

@onready var animationFire = $Sprite2D/AnimatedSprite2D
@onready var playerLifeBar = get_node("../Player/Life/LifeBarChanged/ProgressBarPlayer")
@onready var playerLifeBarLabel = get_node("../Player/Life/LifeBarChanged/Label")
@onready var playerState = get_node("../Player/State Machine")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	animationFire.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Obtém os limites da tela
	var screen_rect = Rect2(Vector2.ZERO, get_viewport_rect().size)
	
	# Remove o nó se a bola de fogo estiver fora da tela
	if not screen_rect.has_point(global_position):
		queue_free()
	move_and_slide()
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		
		print("damage to player")
		playerLifeBar.value = playerLifeBar.value - 20
		playerLifeBarLabel.text = str(playerLifeBar.value) + "/100"
		playerState.current_state.transitioned.emit(playerState.current_state,"Hurt")
	pass # Replace with function body.
