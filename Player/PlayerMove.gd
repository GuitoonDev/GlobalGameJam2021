extends KinematicBody

signal toggle_torch(isOn,p);

export(float, 0.5, 20.0, 0.1) var move_speed := 5.0
export(float, 0.1, 20.0, 0.1) var y_velocity := 5.0
export(float, 1.0, 50.0, 0.1) var jump_force := 30.0
export(float, 10.0, 50.0, 0.1) var max_fall_speed := 30.0

onready var footstep_sfx_player := $FootstepRandomSFXPlayer
onready var cheat_transform = $CheatTeleport.global_transform.origin

const GRAVITY := 0.75

export var canUse_torch = false;
export var canCheat = false;

var torch_is_On = false;
var is_grounded_last_frame := false;
var cancelGravity = false;
var canRotate = true;
var tmp_tr;

var game_end = false;

func _ready():
	add_to_group("Player");

func _input(event):
	if event is InputEventMouseMotion and canRotate:
		rotation_degrees.y -= $Camera.mouse_sensitivity * event.relative.x

func _process(_delta):
	if Input.is_action_just_released("interact"):
		get_tree().call_group("Interactable", "Interact", self)
	if  canUse_torch and Input.is_action_just_pressed("toggle_flashlight"):
		$flash_on.play()
		torch_is_On = true;
		emit_signal("toggle_torch",torch_is_On,self)
	if canUse_torch and Input.is_action_just_released("toggle_flashlight"):
		$flash_off.play()
		torch_is_On = false;
		emit_signal("toggle_torch",torch_is_On,self)
	if Input.is_action_just_released("dev_cheat") and canCheat:
		global_transform.origin = cheat_transform
	

func _physics_process(_delta) -> void:
	
	var move_delta := Vector3()
	var grounded = is_on_floor()
	
	if Input.is_action_pressed("move_forward"):
		move_delta.z -= 1
	if Input.is_action_pressed("move_backward"):
		move_delta.z += 1
	if Input.is_action_pressed("move_left"):
		move_delta.x -= 1
	if Input.is_action_pressed("move_right"):
		move_delta.x += 1

	move_delta = move_delta.normalized()
	
	if move_delta.length() >= 0.5 and not footstep_sfx_player.is_playing and grounded:
		footstep_sfx_player.play()
	elif move_delta.length() < 0.5:
		footstep_sfx_player.stop()
		
	
	move_delta = move_delta.rotated(Vector3(0, 1, 0), rotation.y)
	move_delta *= move_speed
	move_delta.y = y_velocity
# warning-ignore:return_value_discarded
	if !game_end:
		move_and_slide(move_delta, Vector3.UP)
	
	
	y_velocity -= GRAVITY
	if grounded and Input.is_action_just_pressed("jump"):
		$JumpRandomSFXPlayer.play()
		y_velocity = jump_force
	
	if grounded and y_velocity <= 0:
		y_velocity = -0.1
		
	#if not is_grounded_last_frame and grounded:
		#$FallRandomSFXPlayer.play()
	
	if cancelGravity:
		y_velocity = 0.0
	else :
		y_velocity = max(y_velocity, -max_fall_speed)
		is_grounded_last_frame = grounded
	
func grant_Torch():
	canUse_torch = true;
	$Camera/Flashlight.visible = true
	$grant_torch.play()

func show_Ebutton():
	$Ebutton/Sprite.visible = true;
	yield(get_tree().create_timer(1.0), "timeout")
	$Ebutton/Sprite.visible = false;

func show_ERbutton():
	$Ebutton_cube/Sprite.visible = true;
	yield(get_tree().create_timer(1.0), "timeout")
	$Ebutton_cube/Sprite.visible = false;

func endgame():
	yield(get_tree().create_timer(3.5), "timeout")
	game_end = true;
	canRotate = false;
	$Camera.canRotate = false;
	yield(get_tree().create_timer(0.49), "timeout")
	tmp_tr = global_transform
	#var tmp = global_transform
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#global_transform = tmp


func endsetupOK():
	global_transform = tmp_tr;
	canRotate = true;
	$Camera.canRotate = true;
