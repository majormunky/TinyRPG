extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_button_button_up():
	print("Button clicked")
	SceneManager.load_new_scene("res://scenes/Game.tscn")
