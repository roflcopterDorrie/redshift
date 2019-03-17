extends RigidBody

export var static_speed = true

export var top_speed = 2.0
export var life = 1.0

func _ready():
	
	# When the timer runs out, trigger the reloaded function
	$Timer.connect('timeout', self, 'queue_free')
	$Timer.start(life)
	
	if (static_speed):
		# Set max speed
		var basis = global_transform.basis
		var thrust = basis.xform(Vector3(0,0,top_speed/100.0))
		apply_central_impulse(thrust)
	
func _physics_process(delta):
	#if (!static_speed):
	pass