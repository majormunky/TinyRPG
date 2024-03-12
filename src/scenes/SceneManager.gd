extends Node


var _load_progress_timer: Timer
var _content_path:String
signal content_finished_loading(content)

# Called when the node enters the scene tree for the first time.
func _ready():
	content_finished_loading.connect(done_loading)


func load_new_scene(scene_path: String, _transition_type: String="fade"):
	load_content(scene_path)


func load_content(scene_path: String):
	_content_path = scene_path

	var _loader = ResourceLoader.load_threaded_request(_content_path)
	_load_progress_timer = Timer.new()
	_load_progress_timer.wait_time = 0.1
	_load_progress_timer.timeout.connect(monitor_load_status)
	get_tree().root.add_child(_load_progress_timer)
	_load_progress_timer.start()


func monitor_load_status():
	var load_progress = []
	var load_status = ResourceLoader.load_threaded_get_status(_content_path, load_progress)
	
	match load_status:
		ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
			pass
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			pass
		ResourceLoader.THREAD_LOAD_FAILED:
			pass
		ResourceLoader.THREAD_LOAD_LOADED:
			_load_progress_timer.stop()
			_load_progress_timer.queue_free()
			content_finished_loading.emit(ResourceLoader.load_threaded_get(_content_path).instantiate())


func done_loading(content):
	var outgoing_scene = get_tree().current_scene
	outgoing_scene.queue_free()
	
	get_tree().root.call_deferred("add_child", content)
	get_tree().set_deferred("current_scene", content)

