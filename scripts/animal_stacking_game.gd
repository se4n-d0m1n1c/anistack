extends Node2D

@export var game_over_screen: CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_over_area_body_entered(body: Node2D) -> void:
	get_tree().paused = true;
	$GameOversScreen.show()
	pass # Replace with function body.


func _on_button_pressed() -> void:
	game_over_screen.get_tree().reload_current_scene()
	print('hello')
	
	
