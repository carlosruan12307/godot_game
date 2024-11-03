extends StaticBody2D

@onready var ShaderRect = get_node("../ColorRect")
@onready var bowAim = get_node("../BowAim")
@onready var player = get_node("../Player")
@onready var playerLifeBar = get_node("../Player/Life/LifeBarChanged/ProgressBarPlayer")
@onready var lifeBarLabel = get_node("../Player/Life/LifeBarChanged/Label")
@onready var bow = get_node("../Bow")
@onready var SpawnBow = get_node("../BowSpawn")
@onready var phase = get_node("../")
var oneTimeFirstPhase = true
@export var aumentarRaio = 0.23

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_button_pressed() -> void:
	if phase != null:
		if phase.name == "FirstPhase":
			playerLifeBar.value = 100;
			lifeBarLabel.text = str(playerLifeBar.value) + "/100"
			get_tree().paused = false
			queue_free()
		elif  phase.name == "SecondPhase":
			bowAim.global_position = player.global_position
			ShaderRect.material.set_shader_parameter("raio", aumentarRaio)
			get_tree().paused = false
			queue_free()
			bow.queue_free()

	pass # Replace with function body.

func randomBowSpawn() -> Node:
	var random_child: Node
	while true:
		var random_index = randi() % SpawnBow.get_child_count()
		random_child = SpawnBow.get_child(random_index)
		
		# Verifica se a posição é diferente da última posição de spawn
		if random_child.global_position != bow.lastSpawn:
			break  # Sai do loop se encontrar uma posição válida
			
	return random_child
func _on_button_2_pressed() -> void:
	if phase != null:
		if phase.name == "FirstPhase":
			get_tree().paused = false
			queue_free()

		elif  phase.name == "SecondPhase":
			get_tree().paused = false
			queue_free()
			var spawnRandom = randomBowSpawn()
			#bow.queue_free()
			bow.lastSpawn = spawnRandom.global_position
	
			bow.global_position = spawnRandom.global_position
	#bow.queue_free()
	pass # Replace with function body.
