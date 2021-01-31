extends "res://GPE/Dynamics/Interactable/Interactable.gd"
signal button_toggle_press(toggle);

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func Interact(p):
#	var dist = transform.origin.distance_to(p.transform.origin);
#	#var b_ori = get_translation().basis.z
#	#var p_ori = (p.get_translation() - b_ori).normalized()
#	if dist <= max_dist :#and (acos(b_ori.dot(p_ori)) <= def2rad(60) ):
#		if activated:
#			Deactivate();
#		else:
#			Activate();

func Activate():
	print("Button On")
	.Activate()
	emit_signal("button_toggle_press",activated)
	
func Deactivate():
	print("Button Off")
	.Deactivate()
	emit_signal("button_toggle_press",activated)
