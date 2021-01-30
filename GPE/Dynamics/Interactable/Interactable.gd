extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var activated = false;
export var max_dist = 3.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Interactable")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func Interact(p):
	var dist = transform.origin.distance_to(p.transform.origin);
	if dist <= max_dist:
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
