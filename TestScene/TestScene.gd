extends Spatial
signal endgame();
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false;

func _on_GameOverTrigger_body_shape_entered(body_id, body, body_shape, area_shape):
	$CanvasLayer/UserInterfaceCredit.GameOverTrigger();
	emit_signal("endgame");
