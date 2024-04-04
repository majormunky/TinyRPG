extends Node2D


@onready var world_manager = $WorldManager
@onready var player = $Player
@onready var ui = $UI
@onready var Teleporter = preload("res://scenes/Maps/Teleporter.tscn")
@onready var BattleScene = preload("res://scenes/BattleScene.tscn")
@onready var battle_scene_manager = $BattleSceneManager
@onready var _loading_screen_scene: PackedScene = preload("res://scenes/LoadingScreen.tscn")
var _loading_screen: LoadingScreen


# Called when the node enters the scene tree for the first time.
func _ready():
	var starting_map = Teleporter.instantiate()
	starting_map.level_to_load = "res://scenes/Maps/WorldMap.tscn"
	starting_map.name = "WorldMap"
	world_manager.load_map(starting_map)
	set_player_position()


func set_player_position():
	var player_start = world_manager.get_player_start_position()
	print("Setting player position at ", player_start)
	player.position.x = player_start.x
	player.position.y = player_start.y
	player.movement_enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_teleporter_hit(area):
	print("In Game, Teleporter Hit: ", area.name)
	world_manager.load_map(area, false)


func _on_world_manager_map_loaded(map_name):
	print("Map Loaded: " + map_name)
	set_player_position()


func _on_player_monster_hit(area):
	var shape = area.get_node("CollisionShape2D")
	var tile_type = world_manager.get_tile_at_position(shape.global_position)
	if tile_type == null:
		print("Tile type is null, stopping")
		return
	load_battle_scene(tile_type)
	
	
func load_battle_scene(area_type):
	var transition_type = "fade_to_black"
	
	_loading_screen = _loading_screen_scene.instantiate() as LoadingScreen
	get_tree().root.add_child(_loading_screen)
	_loading_screen.start_transition(transition_type)
	await _loading_screen.transition_is_complete
	
	# hide world
	world_manager.visible = false
	# hide player
	player.visible = false
	
	var battle_scene = BattleScene.instantiate()
	battle_scene_manager.add_child(battle_scene)
	battle_scene.setup(area_type)
	battle_scene_manager.visible = true
	# battle_scene.visible = true
	
	await get_tree().create_timer(0.5).timeout
	if _loading_screen != null:
		_loading_screen.finish_transition()
	
