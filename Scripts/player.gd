extends CharacterBody2D

enum Rotation { LEFT, RIGHT, NONE }


## Get rotation direction from the input
func get_rotation_direction() -> Rotation:
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
