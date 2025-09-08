extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var explosion_area: Area2D = $ExplosionArea

func _ready():
	explosion_area.area_entered.connect(on_area_entered)
	await animation_player.animation_finished
	queue_free()

func on_area_entered(enemy_hitbox: EnemyHitbox):
	enemy_hitbox.was_shot()
