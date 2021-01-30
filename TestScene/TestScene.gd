extends Spatial

func _process(_delta):
	if Input.is_action_pressed("exit"):
		get_tree().quit()
