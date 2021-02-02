extends Spatial


enum wall_type{
	Phantom,
	Regular,
	Persistent,
	Fake,
	Shadow,
	Phantom_Effect,
	Regular_Effect
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
		wall_type.Phantom_Effect:
			wallMaterial = load("res://Assets/Materials/floor_phantom_effect.tres")
		wall_type.Regular_Effect:
			wallMaterial = load("res://Assets/Materials/floor_regular_effect.tres")
			
	$wall.material_override = wallMaterial;
	
	$wall/StaticBody/CollisionShape.disabled = !hasCollision;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
