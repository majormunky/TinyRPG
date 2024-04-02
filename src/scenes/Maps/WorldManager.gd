extends Node2D

signal map_loaded(map_name)
var current_map = null
var previous_map_name = null
var _loading_screen: LoadingScreen
var _loading_screen_scene: PackedScene = preload("res://scenes/LoadingScreen.tscn")


func get_player_start_position():
	var pos_name = null
	if previous_map_name == null:
		pos_name = "GameStart"
	else:
		pos_name = "From" + previous_map_name

	var locations = current_map.get_node("Positions")
	var marker = locations.find_child(pos_name)
	return marker.position


func clear_map():
	if current_map != null:
		current_map.queue_free()
		current_map = null


func load_map(teleporter, skip_transition: bool = true):
	var transition_type = "fade_to_black"
	var map_to_load = teleporter.name
	
	if not skip_transition:
		_loading_screen = _loading_screen_scene.instantiate() as LoadingScreen
		get_tree().root.add_child(_loading_screen)
		_loading_screen.start_transition(transition_type)
		await _loading_screen.transition_is_complete
	
	if current_map:
		previous_map_name = current_map.name
		print("Previous Map Name: " + previous_map_name)
	else:
		print("Current map not set, not setting previous map name")
	
	# unload old map
	clear_map()
	
	# load in new map
	var map_path = teleporter.level_to_load
	var map_scene = load(map_path)
	var map = map_scene.instantiate()
	
	call_deferred("add_child", map)
	current_map = map
	
	if not skip_transition:
		await get_tree().create_timer(0.5).timeout
		if _loading_screen != null:
			print("It is, running finish_transition")
			_loading_screen.finish_transition()
	
	emit_signal("map_loaded", map_to_load)


func get_tile_at_position(pos):
	var tilemap = current_map.get_node("TileMap")
	var cell_position = tilemap.local_to_map(tilemap.to_local(pos))
	var data = tilemap.get_cell_tile_data(0, cell_position)
	if data:
		var tile_type = data.get_custom_data("tile_type")
		return tile_type
	else:
		return null
