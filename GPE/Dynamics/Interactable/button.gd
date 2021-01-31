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

func Interact(p):
	#var angle = global_transform.origin.dot(p.global_transform.origin)
	#print(angle)
	#if angle > 0:
	.Interact(p)

func Activate():
	#print("Button On")
	.Activate()
	emit_signal("button_toggle_press",activated)
	
func Deactivate():
	#print("Button Off")
	.Deactivate()
	emit_signal("button_toggle_press",activated)
