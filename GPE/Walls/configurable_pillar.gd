extends Spatial


enum wall_type{
	Phantom,
	Regular,
	Persistent,
	Fake,
	Shadow
}

export (wall_type) var wt = wall_type.Regular;
export var hasCollision = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	var wallMaterial; 
	match wt:
		wall_type.Phantom:
			wallMaterial = load("res://Assets/Materials/floor_phantom.tres")
		wall_type.Regular:
			wallMaterial = load("res://Assets/Materials/floor_regular.tres")
		wall_type.Persistent:
			wallMaterial = load("res://Assets/Materials/floor_persistent.tres")
		wall_type.Fake:
			wallMaterial = load("res://Assets/Materials/floor_fake.tres")
		wall_type.Shadow:
			wallMaterial = load("res://Assets/Materials/floor_shadow.tres")
			
	$pillar.material_override = wallMaterial;
	
	$pillar/StaticBody/CollisionShape.disabled = !hasCollision;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
