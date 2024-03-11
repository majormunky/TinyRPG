extends Node

var characters = []


func _ready():
	var player_data = Character.new()
	player_data.character_name = "Zeno"
	player_data.job_name = "Warrior"
	player_data.level = 1
	player_data.max_hit_points = 100
	player_data.current_hit_points = 100
	player_data.max_magic_points = 10
	player_data.current_magic_points = 10
	player_data.strength = 40
	player_data.dexterity = 15
	player_data.intelligence = 10
	
	characters.append(player_data)
