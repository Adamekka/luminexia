extends CharacterBody2D

## Bullet speed
@export var speed: int = 200


func _physics_process(_delta: float):
	# Move bullet in the direction it is facing
	velocity = Vector2(speed, 0).rotated(rotation + 3 * PI / 2)
	move_and_slide()
	pass
