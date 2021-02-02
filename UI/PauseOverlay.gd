extends Control
signal toggle_paused(isPaused)

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")

onready var paused: = false setget set_paused
onready var can_pause = true;

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and can_pause:
		self.paused = not paused
		emit_signal("toggle_paused",paused)
		scene_tree.set_input_as_handled()

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
	if value:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func continue_button():
	$continue.play()
	self.paused = not paused
	emit_signal("toggle_paused",paused)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func exit_button():
	get_tree().quit()

func go_to_MainMenu():
	$returnmenu.play()
	self.paused = not paused
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://UI/MainScreen.tscn")


func _on_TestScene_endgame():
	can_pause = false;
