extends CharacterBody2D

@export var enemy_speed = 80


func _process(delta: float):
	# Move the enemy towards the center of the screen (0, 0)
	position = position.move_toward(Vector2(0, 0), delta * enemy_speed)
	pass
