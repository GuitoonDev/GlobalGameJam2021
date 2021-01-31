extends Control


func go_to_scene():
	$ui_play.play()
	get_tree().change_scene("res://TestScene/TestScene.tscn")

func exit_button():
	get_tree().quit()


func go_to_credit():
	get_tree().change_scene("res://UI/CreditOverlay.tscn")
