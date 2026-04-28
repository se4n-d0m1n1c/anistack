extends Marker2D

@export var animal_scene: Array[PackedScene]
@export var spawn_delay: float = 1.0 
@export var main_camera: Camera2D
@export var move_amount = 50
@export var threshold_distance = 50

func _ready():
	# Spawn the very first animal when the game starts
	spawn_new_animal()

func spawn_new_animal():
	# Safety check in case you forget to assign the scene in the Inspector
	if animal_scene == null:
		print("Error: No animal scene assigned to the spawner!")
		return
		
	var random_animal = animal_scene.pick_random()
	var animal_instance = random_animal.instantiate()

	animal_instance.global_position = global_position
	animal_instance.animal_dropped.connect(_on_animal_dropped)
	
	get_parent().call_deferred("add_child", animal_instance)

func _on_animal_dropped(animal_y):
	# This function runs automatically the moment the player presses Spacebar
	# Create a small, temporary timer so the next animal doesn't appear instantly
	await get_tree().create_timer(spawn_delay).timeout	
	if animal_y < (global_position.y + threshold_distance):
		global_position.y -= move_amount
		if main_camera:
			main_camera.global_position.y -= move_amount
	spawn_new_animal()
