extends AudioStreamPlayer

export(Array, AudioStream) var audio_files : Array
export var is_loop := false
export(float, 0.1, 2.0) var delay_time := 1.0

var is_playing := false

func _ready() -> void:
	randomize()
	connect("finished", self, "_on_RandomSFXPlayer_finished")
	
func play(from_position := 0.0) -> void:
	is_playing = true
	
	var random_index := randi() % audio_files.size()
	.stop()
	stream = audio_files[random_index]
	.play(from_position)

func stop() -> void:
	is_playing = false

func _on_RandomSFXPlayer_finished() -> void:
	yield(get_tree().create_timer(delay_time), "timeout")
	
	if is_loop and is_playing:
		play()
	else:
		is_playing = false
