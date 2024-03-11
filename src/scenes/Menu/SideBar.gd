extends VBoxContainer

var selected_index = null
var menu_items = []
var menu_active = false
signal menu_changed(menu_name)


# Called when the node enters the scene tree for the first time.
func activate():
	for child in get_children():
		menu_items.append(child.name)

	selected_index = 0
	render_menu()


func render_menu():
	for child in get_children():
		child.text = child.name
	
	var selected_menu_item = get_child(selected_index)
	selected_menu_item.text = "> " + selected_menu_item.name
	emit_signal("menu_changed", selected_menu_item.name)


func _unhandled_input(event):
	if menu_active == false:
		return

	var menu_has_changed = false
	if event is InputEventKey:
		if event.is_action_pressed("ui_up"):
			selected_index -= 1
			if selected_index < 0:
				selected_index = len(menu_items) - 1
			menu_has_changed = true
		elif event.is_action_pressed("ui_down"):
			selected_index += 1
			if selected_index >= len(menu_items):
				selected_index = 0
			menu_has_changed = true
	
	if menu_has_changed:
		render_menu()


