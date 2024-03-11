extends Node2D


@onready var world_manager = $WorldManager
@onready var player = $Player
@onready var ui = $UI


# Called when the node enters the scene tree for the first time.
func _ready():
	world_manager.load_map("WorldMap")
	set_player_position()


func set_player_position():
	var player_start = world_manager.get_player_start_position()
	print("Setting player position at ", player_start)
	player.position.x = player_start.x
	player.position.y = player_start.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_teleporter_hit(area_name):
	print("In Game, Teleporter Hit: ", area_name)
	world_manager.load_map(area_name)


func _on_world_manager_map_loaded(map_name):
	print("Map Loaded: " + map_name)
	set_player_position()
