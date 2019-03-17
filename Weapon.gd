extends Spatial

export var rate_of_fire = 5.0
var weapon_loaded = true
var bullet_scene = preload("res://Bullet.tscn")

func _ready():
	# When the timer runs out, trigger the reloaded function
	$Timer.connect('timeout', self, 'reloaded')

# Fire the weapon.
func fire(linear_velocity):
	if (weapon_loaded == true):
		# Start reload timer
		$Timer.start(1.0/rate_of_fire)
		# Create instance of projectile.
		var bullet = bullet_scene.instance()
		# Set rotation and position of projectile to where the weapon currently is.
		bullet.global_transform = global_transform;
		# Add the momentum of the shooter (ship).
		bullet.linear_velocity = linear_velocity
		# Add to the root scene.
		get_tree().get_root().add_child(bullet)
		# Weapon is now reloading.
		weapon_loaded = false

func reloaded():
	weapon_loaded = true