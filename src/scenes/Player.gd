extends CharacterBody2D

var speed = 200
var player_data = null
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")
signal teleporter_hit(name)


#func _ready():
	#player_data = Character.new()
	#player_data.character_name = "Zeno"
	#player_data.job_name = "Warrior"
	#player_data.max_hit_points = 100
	#player_data.current_hit_points = 100
	#player_data.strength = 40
	#player_data.dexterity = 15
	#player_data.intelligence = 10


func _physics_process(delta):
	var input = Vector2.ZERO
	
	input.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	input.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
	input = input.normalized()
	
	if input != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input);
		animation_tree.set("parameters/Walk/blend_position", input);
		# animation_state.travel("Walk")
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		velocity = input * speed * delta
	else:
		#animation_state.travel("Idle")
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
		velocity = Vector2.ZERO

	move_and_collide(velocity)


func _on_body_box_area_entered(area):
	print("Teleporter Hit ", area.name)
	emit_signal("teleporter_hit", area.name)
