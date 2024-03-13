class_name LoadingScreen extends CanvasLayer

@onready var anim_player = $AnimationPlayer
var starting_animation_name: String
signal transition_is_complete


func start_transition(animation_name: String):
	if !anim_player.has_animation(animation_name):
		push_warning("'%s' animation does not exist" % animation_name)
		animation_name = "fade_to_black"
	starting_animation_name = animation_name
	anim_player.play(animation_name)
	

func finish_transition():
	var ending_animation_name = starting_animation_name.replace("to", "from")
	if !anim_player.has_animation(ending_animation_name):
		push_warning("'%s' animation does not exist" % ending_animation_name)
		ending_animation_name = "fade_from_black"
	anim_player.play(ending_animation_name)

	# once this final animation plays, we can free this scene
	await anim_player.animation_finished
	queue_free()


func animation_ended():
	print("Animation Ended")
	emit_signal("transition_is_complete")
