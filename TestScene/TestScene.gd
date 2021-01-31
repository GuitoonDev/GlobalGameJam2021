extends Spatial

func _on_GameOverTrigger_body_shape_entered(body_id, body, body_shape, area_shape):
	$CanvasLayer/UserInterfaceCredit.visible = true
