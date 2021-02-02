extends RigidBody

onready var spawn_point = global_transform

export var needTorchOn = false;
export var max_dist = 1;

var sound_time = 0.0;

func _ready():
	add_to_group("Interactable")
	
func _physics_process(delta):
	if linear_velocity.length() > 1.0 :
		if !$push_sound.playing:
			$push_sound.play(sound_time);
		else:
			sound_time = $push_sound.get_playback_position();
	else:
		$push_sound.stop();

func Interact(p):
	
	var dist = global_transform.origin.distance_to(p.global_transform.origin);
	
	var torchOk = true;
	if needTorchOn:
		torchOk = p.torch_is_On
		
	if dist <= max_dist and torchOk:
		global_transform = spawn_point;


func _on_EBox_body_entered(body):
	if body.is_in_group("Player"):
		body.show_ERbutton()
		
		


func _on_SnapPoint(x, z):
	global_translate(Vector3(x, global_transform.origin.y,z))
	#global_transform.origin.x = x
	#global_transform.origin.z = z
