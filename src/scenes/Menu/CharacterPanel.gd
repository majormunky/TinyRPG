extends HBoxContainer

var character_data: Character
@onready var character_name = $MarginContainer/VBoxContainer/Name
@onready var character_level = $MarginContainer/VBoxContainer/Level
@onready var character_hp = $MarginContainer/VBoxContainer/HP
@onready var character_mp = $MarginContainer/VBoxContainer/MP


func _ready():
	pass # Replace with function body.


func set_character_data(char_data: Character):
	character_data = char_data
	render_panel()


func render_panel():
	character_name.text = character_data.character_name
	character_level.text = "Level: " + str(character_data.level)
	character_hp.text = "HP: " + str(character_data.current_hit_points) + "/" + str(character_data.max_hit_points)
	character_mp.text = "MP: " + str(character_data.current_magic_points) + "/" + str(character_data.max_magic_points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
