extends Node2D

@export var projectile_scene: PackedScene = preload("res://projectiles/projectile.tscn")
@export var projectile_spawns: Array[Marker2D]

func shoot():
	for projectile_spawn in projectile_spawns:
		var projectile = projectile_scene.instantiate()
		projectile.be_shot(Vector2.RIGHT.rotated(rotation) * 400)
		projectile_spawn.add_child(projectile)
		projectile.global_position = projectile_spawn.global_position
