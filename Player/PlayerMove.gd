extends KinematicBody

export var move_speed := 5.0
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= $Camera.mouse_sensitivity * event.relative.x

func _physics_process(delta) -> void:
	var move_delta := Vector3()
	if Input.is_action_pressed("move_forward"):
		move_delta.z -= 1
	if Input.is_action_pressed("move_backward"):
		move_delta.z += 1
	if Input.is_action_pressed("move_left"):
		move_delta.x -= 1
	if Input.is_action_pressed("move_right"):
		move_delta.x += 1

	move_delta = move_delta.normalized()
	move_delta = move_delta.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_collide(move_delta * move_speed)
