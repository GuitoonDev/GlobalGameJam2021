extends Control


func go_to_scene():
	get_tree().change_scene("res://TestScene/TestScene.tscn")

func exit_button():
	get_tree().quit()
