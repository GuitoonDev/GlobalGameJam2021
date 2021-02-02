extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mus_time = 0.0;

func _on_UserInterfacePause_toggle_paused(isPaused):
	if !isPaused:
		play(mus_time);
	else:
		mus_time = get_playback_position()
		stop()
