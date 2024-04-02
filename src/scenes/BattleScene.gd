extends Node2D

@onready var monster_container = $CanvasLayer/HBoxContainer/MonsterListContainer
@onready var player_container = $CanvasLayer/HBoxContainer/PlayerListContainer
@onready var background = $Sprite2D
@onready var canvas_layer = $CanvasLayer


func update_player_container():
	pass


func setup(env_type):
	print("Env Type: " + env_type)
	var backgrounds = {
		"sand": load("res://assets/battle/bg_sand.png"),
		"grass": load("res://assets/battle/bg_f_11.png")
	}
	#var bg_image = ImageTexture.create_from_image(backgrounds[env_type])
	var bg_image = backgrounds[env_type]
	#print(bg_image)
	print(background.texture)
	background.texture = bg_image
	print(background.texture)
	
	canvas_layer.visible = true
