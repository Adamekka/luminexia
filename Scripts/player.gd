extends CharacterBody2D

enum Direction { UP, DOWN, LEFT, RIGHT, NONE }


## Get the direction of the input vector
func get_direction() -> Direction:
	var input_vector: Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	match input_vector:
		Vector2(0, 0):
			return Direction.NONE
		Vector2(1, 0):
			return Direction.RIGHT
		Vector2(-1, 0):
			return Direction.LEFT
		Vector2(0, 1):
			return Direction.DOWN
		Vector2(0, -1):
			return Direction.UP
		_:
			return Direction.NONE


func _physics_process(_delta: float):
	var direction: Direction = get_direction()
	print(direction)

	pass
