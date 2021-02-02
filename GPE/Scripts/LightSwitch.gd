extends Spatial


export (Array, Material) var lampMaterials

# Called when the node enters the scene tree for the first time.

func _ready():
	call_deferred("connect_to_player")

func connect_to_player():
	get_tree().get_nodes_in_group("Player")[0].connect("toggle_torch",self,"toggleTorch")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func toggleTorch(isOn,p):
	for mat in lampMaterials:
		mat.set("shader_param/torchIsOn",isOn)
