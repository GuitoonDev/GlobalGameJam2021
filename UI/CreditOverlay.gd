extends Control
signal endsetupOK()

func GameOverTrigger():
	visible = true;
	
	$ScrollingCredit.visible = true;
	$ScrollingCredit.playAnim();
	
	yield(get_tree().create_timer(4.0), "timeout")
	
	$ReturnButton.visible = true;
	$ReturnButton.disabled = false;
	$QuitButton.visible = true;
	$QuitButton.disabled = false;
	
	#get_tree().paused = true;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	yield(get_tree().create_timer(0.1), "timeout")
	#yield(get_tree(), "idle_frame")
	#get_tree().paused = false;
	emit_signal("endsetupOK")
	#grab_focus()
	#grab_click_focus()
	#get_tree().paused = true;


func ReturnButton_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://UI/MainScreen.tscn")


func QuitButton_pressed():
	get_tree().quit();
