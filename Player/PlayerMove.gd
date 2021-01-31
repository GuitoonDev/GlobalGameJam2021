extends KinematicBody

signal toggle_torch(isOn);

export(float, 0.5, 20.0, 0.1) var move_speed := 5.0
export(float, 0.5, 20.0, 0.1) var y_velocity := 5.0
export(float, 10.0, 50.0, 0.1) var jump_force := 30.0
export(float, 10.0, 50.0, 0.1) var max_fall_speed := 30.0

onready var footstep_sfx_player := $FootstepRandomSFXPlayer

const GRAVITY := 0.6

var canUse_torch = false;
var torch_is_On = false;

func _ready():
	add_to_group("Player");

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= $Camera.mouse_sensitivity * event.relative.x

func _process(_delta):
	if Input.is_action_just_released("interact"):
		get_tree().call_group("Interactable", "Interact", self)
	if  canUse_torch and Input.is_action_just_pressed("toggle_flashlight"):
		$flash_on.play()
		torch_is_On = true;
		emit_signal("toggle_torch",torch_is_On)
	if canUse_torch and Input.is_action_just_released("toggle_flashlight"):
		$flash_off.play()
		torch_is_On = false;
		emit_signal("toggle_torch",torch_is_On)
	

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
	
	if move_delta != Vector3.ZERO and not footstep_sfx_player.is_playing:
		footstep_sfx_player.play()
	elif move_delta == Vector3.ZERO:
		footstep_sfx_player.stop()
		
	
	move_delta = move_delta.rotated(Vector3(0, 1, 0), rotation.y)
	move_delta *= move_speed
	move_delta.y = y_velocity
# warning-ignore:return_value_discarded
	move_and_slide(move_delta, Vector3.UP)
	
	var grounded = is_on_floor()
	y_velocity -= GRAVITY
	if grounded and Input.is_action_just_pressed("jump"):
		y_velocity = jump_force
	
	if grounded and y_velocity <= 0:
		y_velocity = -0.1
	
	y_velocity = max(y_velocity, -max_fall_speed)

func grant_Torch():
	canUse_torch = true;
	$Camera/Flashlight.visible = true
