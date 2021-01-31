extends "res://GPE/Dynamics/Interactable/Interactable.gd"

func Activate():
	get_tree().call_group("Player","grant_Torch");
	queue_free();
