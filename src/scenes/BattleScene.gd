extends Node2D

@onready var monster_container = $CanvasLayer/HBoxContainer/MonsterListContainer
@onready var player_container = $CanvasLayer/HBoxContainer/PlayerListContainer/MarginContainer/VBoxContainer
@onready var background = $Sprite2D
@onready var canvas_layer = $CanvasLayer
@onready var CharacterInfoPanel = load("res://scenes/Menu/BattleScene/CharacterStatus.tscn")


func update_player_container():
	pass


func update_character_panel():
	print("Total Characters", len(PlayerData.characters))
	
	for character in PlayerData.characters:
		var panel = CharacterInfoPanel.instantiate()
		player_container.add_child(panel)
		panel.setup(character)


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
	
	update_character_panel()
