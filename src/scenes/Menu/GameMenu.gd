extends MarginContainer

var menu_active = false
var selected_menu = null
@onready var sidebar = $HBoxContainer/NinePatchRect/MarginContainer/SideBar
@onready var main_section = $HBoxContainer/Main/MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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


func _on_side_bar_menu_changed(menu_name):
	print("Menu Changed: " + menu_name)
	selected_menu = menu_name
	render_main_panel()
