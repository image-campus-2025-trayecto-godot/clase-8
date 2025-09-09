extends Node2D

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var explosion_area: Area2D = $ExplosionArea

func _ready():
	explosion_area.area_entered.connect(on_area_entered)
	gpu_particles_2d.restart()
	await gpu_particles_2d.finished
	queue_free()

func on_area_entered(enemy_hitbox: EnemyHitbox):
	enemy_hitbox.was_shot()
