extends CanvasLayer

@onready var game_menu = $GameMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("menu_toggle"):
		game_menu.toggle()
		get_tree().paused = game_menu.visible
		
