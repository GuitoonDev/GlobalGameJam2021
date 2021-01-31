extends Spatial

func _on_Area_body_entered(_body):
	$CanvasLayer/UserInterfaceCredit.visible = true
