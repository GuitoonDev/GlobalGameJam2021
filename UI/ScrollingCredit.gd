extends Control
signal endgame();
func _ready():
	$AnimationPlayer.play("scroll")
	

func playAnim():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("scroll")

