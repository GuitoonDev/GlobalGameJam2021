extends Camera

export var mouse_sensitivity := 0.5

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= mouse_sensitivity * event.relative.x
		rotation_degrees.x -= mouse_sensitivity * event.relative.y
