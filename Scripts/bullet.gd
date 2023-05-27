extends Area2D

## Bullet speed
@export var speed: int = 200
## Division is slow
const PI_2: float = PI / 2


func _physics_process(delta: float):
	# Move bullet in the direction it is facing
	position += Vector2(speed * delta, 0).rotated(rotation + 3 * PI_2)
	# Destroy bullet after TTL
	await get_tree().create_timer(5).timeout
	queue_free()

	pass
