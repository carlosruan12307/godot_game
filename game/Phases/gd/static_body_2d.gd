extends CharacterBody2D
@onready var lifeBar = get_node("../Player/Life/LifeBarChanged/ProgressBarPlayer")
@onready var state = get_node("../Player/State Machine")
var previous_normal = Vector2.UP 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	## Obtém a normal do chão
	#var normal = get_floor_normal()
#
	## Interpolação suave entre a normal anterior e a nova normal
	#normal = previous_normal.lerp(normal, 0.1)
#
	## Ajusta a rotação com base na normal interpolada
	#var angle = normal.angle_to(Vector2.UP)
	#rotation = -angle
#
	## Atualiza a normal anterior
	#previous_normal = normal
	move_and_slide()
	pass


#func _on_area_2d_body_entered(body: Node2D) -> void:
	## Verifica se o corpo atingido é o personagem
	#if body.is_in_group("Player"):  
		#lifeBar.value -= 15
		#if state !=null:
			#state.current_state.transitioned.emit(state.current_state,"Hurt")
#
	## Desativa a colisão do raio logo após o impacto
	#collisionLight.disabled = true
	#pass # Replace with function body.
