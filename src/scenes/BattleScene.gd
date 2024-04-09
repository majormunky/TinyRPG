extends Node2D

@onready var monster_container = $CanvasLayer/HBoxContainer/MonsterListContainer
@onready var player_container = $CanvasLayer/HBoxContainer/PlayerListContainer/MarginContainer/VBoxContainer
@onready var background = $Sprite2D
@onready var canvas_layer = $CanvasLayer
@onready var CharacterInfoPanel = load("res://scenes/Menu/BattleScene/CharacterStatus.tscn")


func _ready():
	# setup("sand")
	pass


func clear_player_list():
	for child in player_container.get_children():
		child.queue_free()


func update_character_panel():
	clear_player_list()
	for character in PlayerData.characters:
		var panel = CharacterInfoPanel.instantiate()
		player_container.add_child(panel)
		panel.setup(character)


func setup(env_type):
	var backgrounds = {
		"sand": load("res://assets/battle/bg_sand.png"),
		"grass": load("res://assets/battle/bg_f_11.png")
	}
	var bg_image = backgrounds[env_type]
	background.texture = bg_image
	canvas_layer.visible = true
	
	update_character_panel()
