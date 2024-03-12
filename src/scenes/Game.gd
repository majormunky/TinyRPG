extends Node2D


@onready var world_manager = $WorldManager
@onready var player = $Player
@onready var ui = $UI
@onready var teleporter = preload("res://scenes/Maps/Teleporter.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var starting_map = teleporter.instantiate()
	starting_map.level_to_load = "res://scenes/Maps/WorldMap.tscn"
	starting_map.name = "WorldMap"
	world_manager.load_map(starting_map)
	set_player_position()


func set_player_position():
	var player_start = world_manager.get_player_start_position()
	print("Setting player position at ", player_start)
	player.position.x = player_start.x
	player.position.y = player_start.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_teleporter_hit(area):
	print("In Game, Teleporter Hit: ", area.name)
	world_manager.load_map(area)


func _on_world_manager_map_loaded(map_name):
	print("Map Loaded: " + map_name)
	set_player_position()
