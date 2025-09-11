extends Node2D

@export var time_until_it_stops_causing_damage: float = 0.3
@onready var explosion_area: Area2D = $ExplosionArea
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func _ready():
	explosion_area.area_entered.connect(on_area_entered)
	animation_player.play("explode")
	await animation_player.animation_finished
	queue_free()

func on_area_entered(enemy_hitbox: EnemyHitbox):
	if time_until_it_stops_causing_damage > 0:
		enemy_hitbox.was_shot()

func _process(delta: float) -> void:
	time_until_it_stops_causing_damage -= 0.0
