extends Node2D

var enemy_scene = preload("res://Entities/Enemies/enemy_square.tscn")


func _on_timer_timeout():
	# Spawn enemy
	var enemy = enemy_scene.instantiate()

	# Get random direction 0-3
	var dir: int = randi() % 4

	match dir:
		# Top
		0:
			enemy.position = Vector2(randf_range(-1100, 1100), -550)
		# Bottom
		1:
			enemy.position = Vector2(randf_range(-1100, 1100), 550)
		# Left
		2:
			enemy.position = Vector2(-1100, randf_range(-550, 550))
		# Right
		3:
			enemy.position = Vector2(1100, randf_range(-550, 550))

	add_child(enemy)
	pass
