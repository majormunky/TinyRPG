extends MarginContainer

var menu_active = false
var selected_menu = null
var character_panel = preload("res://scenes/Menu/CharacterPanel.tscn")
@onready var sidebar = $HBoxContainer/NinePatchRect/MarginContainer/SideBar
@onready var main_section = $HBoxContainer/Main/MarginContainer
@onready var character_panels = $HBoxContainer/Main/MarginContainer/Status/CharacterPanels

func _ready():
	visible = false


func toggle():
	menu_active = !menu_active
	if menu_active:
		visible = true
		sidebar.activate()
	else:
		visible = false
	sidebar.menu_active = menu_active
	


func render_main_panel():
	if selected_menu == null:
		return
	
	for child in main_section.get_children():
		if child.name == selected_menu:
			child.visible = true
		else:
			child.visible = false
	
	for panel in character_panels.get_children():
		panel.queue_free()
	
	for char_data in PlayerData.characters:
		var new_panel = character_panel.instantiate()
		character_panels.add_child(new_panel)
		new_panel.set_character_data(char_data)



func _on_side_bar_menu_changed(menu_name):
	print("Menu Changed: " + menu_name)
	selected_menu = menu_name
	render_main_panel()
