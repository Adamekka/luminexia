extends CharacterBody2D

enum Rotation { LEFT, RIGHT, NONE }

var bullet = preload("res://Entities/Misc/bullet.tscn")
## Division is slow
const pi_2 = PI / 2


## Get rotation direction from the input
func get_rotation_direction() -> Rotation:
	if Input.get_action_strength("right") == 1 and Input.get_action_strength("left") == 1:
		return Rotation.NONE
	if Input.get_action_strength("right") == 1:
		return Rotation.RIGHT
	elif Input.get_action_strength("left") == 1:
		return Rotation.LEFT
	else:
		return Rotation.NONE


func _physics_process(delta: float):
	var player_rotation: float = 0

	var rotation_direction: Rotation = get_rotation_direction()
	match rotation_direction:
		Rotation.LEFT:
			player_rotation = -1
		Rotation.RIGHT:
			player_rotation = 1
		Rotation.NONE:
			player_rotation = 0

	# Rotate the player
	rotate(player_rotation * delta)


func _process(_delta: float):
	# Shoot
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = bullet.instantiate()
		bullet_instance.rotation = rotation
		# Spawn the bullet in front of the player
		bullet_instance.position = Vector2(30 * sin(rotation), 30 * -cos(rotation))
		add_sibling(bullet_instance)
		pass
