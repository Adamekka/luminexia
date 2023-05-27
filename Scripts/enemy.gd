extends Area2D

@export var enemy_speed: int = 80


func _process(delta: float):
	# Move the enemy towards the center of the screen (0, 0)
	position = position.move_toward(Vector2(0, 0), delta * enemy_speed)
	rotation = Vector2(0, 0).angle_to_point(position)

	pass
