extends Node

var characters = []


func create_character(data):
	var player_data = Character.new()
	player_data.character_name = data["name"]
	player_data.job_name = data["job_name"]
	player_data.level = data["level"]
	player_data.max_hit_points = data["max_hit_points"]
	player_data.current_hit_points = data["current_hit_points"]
	player_data.max_magic_points = data["max_magic_points"]
	player_data.current_magic_points = data["current_magic_points"]
	player_data.strength = data["strength"]
	player_data.dexterity = data["dexterity"]
	player_data.intelligence = data["intelligence"]
	
	return player_data


func _ready():
	var p1 = {
		"name": "Zeno",
		"job_name": "Warrior",
		"level": 1,
		"max_hit_points": 100,
		"current_hit_points": 100,
		"max_magic_points": 10,
		"current_magic_points": 10,
		"strength": 40,
		"dexterity": 15,
		"intelligence": 10
	}
	
	var p2 = {
		"name": "Torin",
		"job_name": "Cleric",
		"level": 1,
		"max_hit_points": 60,
		"current_hit_points": 60,
		"max_magic_points": 40,
		"current_magic_points": 40,
		"strength": 20,
		"dexterity": 15,
		"intelligence": 40
	}
	
	var p3 = {
		"name": "SneakyCab",
		"job_name": "Thief",
		"level": 1,
		"max_hit_points": 60,
		"current_hit_points": 60,
		"max_magic_points": 10,
		"current_magic_points": 10,
		"strength": 20,
		"dexterity": 35,
		"intelligence": 10
	}
	
	var p4 = {
		"name": "FireCab",
		"job_name": "Mage",
		"level": 1,
		"max_hit_points": 40,
		"current_hit_points": 40,
		"max_magic_points": 50,
		"current_magic_points": 50,
		"strength": 15,
		"dexterity": 15,
		"intelligence": 40
	}
	
	characters.append(create_character(p1))
	characters.append(create_character(p2))
	characters.append(create_character(p3))
	characters.append(create_character(p4))
	
