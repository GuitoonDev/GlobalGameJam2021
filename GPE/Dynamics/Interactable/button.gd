extends "res://GPE/Dynamics/Interactable/Interactable.gd"
signal button_toggle_press(toggle);

var isOnArea = false;

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		isOnArea = true;
		showE(body)
			


func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		isOnArea = false;


func _on_Player_toggle_torch(isOn,p):
	if isOnArea:
		showE(p);

func Interact(p):
	#var angle = global_transform.origin.dot(p.global_transform.origin)
	#print(angle)
	#if angle > 0:
	.Interact(p)

func Activate():
	#print("Button On")
	.Activate()
	$pressButton.play()
	emit_signal("button_toggle_press",activated)
	
func Deactivate():
	#print("Button Off")
	.Deactivate()
	$pressButton.play()
	emit_signal("button_toggle_press",activated)

func showE(p):
	if p.torch_is_On:
		p.show_Ebutton();
