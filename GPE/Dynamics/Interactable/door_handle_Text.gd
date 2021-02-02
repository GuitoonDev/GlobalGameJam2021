extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isOnArea = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		isOnArea = true;
		if body.torch_is_On:
			visible = true;


func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		isOnArea = false;

func _on_Player_toggle_torch(isOn,p):
	if isOnArea and isOn:
		visible = true;
	else:
		visible = false;
