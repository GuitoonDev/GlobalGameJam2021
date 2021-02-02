extends Control

#func _ready():
var clic_play = false;

func go_to_scene():
	if !clic_play:
		clic_play = true;
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		$ui_play.play()
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://TestScene/TestScene.tscn")

func exit_button():
	get_tree().quit()


func go_to_credit():
	get_tree().change_scene("res://UI/CreditOverlay.tscn")
