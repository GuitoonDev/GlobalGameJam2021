extends Control

func _on_UserInterfaceCredit_visibility_changed():
	$AnimationPlayer.play("scroll")


func return_button():
	get_tree().change_scene("res://UI/MainScreen.tscn")
