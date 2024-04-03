extends HBoxContainer

@onready var character_name = $Name
@onready var health = $Health


func setup(character_data: Character):
	character_name.text = character_data.character_name
	health.text = str(character_data.current_hit_points) + "/" + str(character_data.max_hit_points)
