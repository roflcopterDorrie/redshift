extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var shooting = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	# Thrust
	if Input.is_action_pressed("ui_up"):
		$"Player Ship".accelerate_ship(delta)
	
	# Rotation
	if Input.is_action_pressed("ui_left"):
		$"Player Ship".rotate_ship(1)
	elif Input.is_action_pressed("ui_right"):
		$"Player Ship".rotate_ship(-1)
	else:
		$"Player Ship".rotate_ship(0)
		
	# Camera follow
	$Camera.transform.origin.z = $"Player Ship".transform.origin.z
	$Camera.transform.origin.x = $"Player Ship".transform.origin.x
	
	# Shoot
	if Input.is_action_pressed("ui_shoot"):
		#if (!shooting):
		$"Player Ship".fire()
		#shooting = true