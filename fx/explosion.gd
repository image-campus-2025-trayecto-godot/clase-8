extends Node2D

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	gpu_particles_2d.one_shot = true
	gpu_particles_2d.restart()
	await gpu_particles_2d.finished
	queue_free()
