extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_TriggerBox_button_toggle_press(toggle):
	if toggle:
		anim_player.play("Down")
		$AudioStreamPlayer.play()
	else:
		anim_player.play("Up")
		$AudioStreamPlayer.play()
