extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var activated = false;
export var max_dist = 5.0;
export var needTorchOn = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Interactable")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Interact(p):
	
	var dist = global_transform.origin.distance_to(p.global_transform.origin);
	
	var torchOk = true;
	
	if needTorchOn:
		torchOk = p.torch_is_On
	if dist <= max_dist and torchOk:
		if activated:
			Deactivate();
		else:
			Activate();
			
func Deactivate():
	activated = false;
	pass

func Activate():
	activated = true;
	pass
