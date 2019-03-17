extends RigidBody

export var acceleration = 200
export var top_speed = 5
export var rotate = 2

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func accelerate_ship(delta):
	#if linear_velocity.length() < top_speed:
	#	se
	
	var basis = global_transform.basis
	var thrust = basis.xform(Vector3(0,0,acceleration))
	add_central_force(thrust * delta)
	
	
func rotate_ship(direction):
	angular_velocity.y = rotate * direction
	
func fire():
	$Weapon.fire(linear_velocity)