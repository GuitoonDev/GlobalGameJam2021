extends Control
	
func _ready():
	$AnimationPlayer.play("scroll")

func _on_UserInterfaceCredit_visibility_changed():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("scroll")

func return_button():
	get_tree().change_scene("res://UI/MainScreen.tscn")
