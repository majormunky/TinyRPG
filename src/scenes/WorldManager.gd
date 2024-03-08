extends Node2D

signal map_loaded(map_name)

var map_data = {
	"House1": preload("res://scenes/Maps/House1.tscn"),
	"WorldMap": preload("res://scenes/Maps/WorldMap.tscn")
}
var current_map = null
var previous_map_name = null


func _ready():
	pass # Replace with function body.


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


func load_map(map_name):
	if current_map:
		previous_map_name = current_map.name
	
	# unload old map
	clear_map()
	
	# load in new map
	var map = map_data[map_name].instantiate()
	call_deferred("add_child", map)
	current_map = map
	
	emit_signal("map_loaded", map_name)
