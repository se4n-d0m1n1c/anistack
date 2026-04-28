extends RigidBody2D

signal animal_dropped
var movement_speed: float = 200;
var rotation_speed: float = 5;
var is_dropped: bool = false;
var has_spawned: bool = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	freeze = true;
	sleeping_state_changed.connect(_on_sleeping_state_changed)


func _on_sleeping_state_changed():  
	if(has_spawned == false):
		animal_dropped.emit(global_position.y)
		has_spawned = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dropped == true:
		return
	
	var direction = Input.get_axis("ui_left", "ui_right");
	if(position.x + direction * movement_speed * delta >= 100 or position.x + direction * movement_speed * delta <= -100 ):
		return
	position.x += direction * movement_speed * delta;
	
	
	var rotation_dir = Input.get_axis("ui_up", "ui_down");
	rotation += rotation_dir * rotation_speed * delta;
	pass
	
	if Input.is_action_just_pressed("ui_accept"):
		is_dropped = true;
		freeze = false;
		
	
