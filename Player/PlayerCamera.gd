extends Camera

export var mouse_sensitivity := 0.5
export var rotation_x_min := -75.0
export var rotation_x_max := 75.0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.x -= mouse_sensitivity * event.relative.y
		
		rotation_degrees.x = clamp(rotation_degrees.x, rotation_x_min, rotation_x_max)
