extends HBoxContainer

var character_data: Character
var portraits = {
	"Warrior": preload("res://assets/characters/warrior.png"),
	"Cleric": preload("res://assets/characters/cleric.png"),
	"Thief": preload("res://assets/characters/thief.png"),
	"Mage": preload("res://assets/characters/mage.png")
}

@onready var character_name = $MarginContainer/VBoxContainer/HBoxContainer/Name
@onready var job = $MarginContainer/VBoxContainer/HBoxContainer/Job
@onready var character_level = $MarginContainer/VBoxContainer/Level
@onready var character_hp = $MarginContainer/VBoxContainer/HP
@onready var character_mp = $MarginContainer/VBoxContainer/MP
@onready var portrait = $Portrait

func _ready():
	pass # Replace with function body.


func set_character_data(char_data: Character):
	character_data = char_data
	render_panel()


func render_panel():
	character_name.text = character_data.character_name
	job.text = character_data.job_name
	character_level.text = "Level: " + str(character_data.level)
	character_hp.text = "HP: " + str(character_data.current_hit_points) + "/" + str(character_data.max_hit_points)
	character_mp.text = "MP: " + str(character_data.current_magic_points) + "/" + str(character_data.max_magic_points)
	portrait.texture = portraits[character_data.job_name]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
