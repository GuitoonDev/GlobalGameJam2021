extends KinematicBody

export(float, 0.5, 20.0, 0.1) var move_speed := 5.0
export(float, 0.5, 20.0, 0.1) var y_velocity := 5.0
export(float, 10.0, 50.0, 0.1) var jump_force := 30.0
export(float, 10.0, 50.0, 0.1) var max_fall_speed := 30.0

const GRAVITY := 0.88
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= $Camera.mouse_sensitivity * event.relative.x

func _physics_process(_delta) -> void:
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
	move_delta *= move_speed
	move_delta.y = y_velocity
# warning-ignore:return_value_discarded
	move_and_slide(move_delta, Vector3.UP)
	
	var grounded = is_on_floor()
	y_velocity -= GRAVITY
	
	if Input.is_action_just_pressed("jump"):
		print("grounded : " + str(grounded))
		print("Input.is_action_just_pressed(\"jump\") : " + str(Input.is_action_just_pressed("jump")))
	
	if grounded and Input.is_action_just_pressed("jump"):
		y_velocity = jump_force
	
	if grounded and y_velocity <= 0:
		y_velocity = -0.1
	
	y_velocity = max(y_velocity, -max_fall_speed)
