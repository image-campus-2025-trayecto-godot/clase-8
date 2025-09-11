extends Node2D

@export var shoot_delay_in_seconds: float = 0.12
@export var projectile_scene: PackedScene = preload("res://projectiles/projectile.tscn")
@export var projectile_spawns: Array[Marker2D]
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func shoot():
	animation_player.play("shoot")
	await get_tree().create_timer(shoot_delay_in_seconds).timeout
	spawn_projectiles()

func spawn_projectiles():
	for projectile_spawn in projectile_spawns:
		var projectile = projectile_scene.instantiate()
		projectile.be_shot(Vector2.RIGHT.rotated(global_rotation) * 400)
		projectile_spawn.add_child(projectile)
		projectile.global_position = projectile_spawn.global_position
