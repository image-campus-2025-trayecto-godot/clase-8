class_name Enemy
extends PathFollow2D

const EXPLOSION = preload("res://fx/explosion.tscn")

@export var falling_scene: PackedScene = preload("res://fx/plane_falling.tscn")

@export var score: int = 1
@export var hit_points: int = 1
@onready var current_hit_points: int = hit_points
@export_range(1, 1000, 1) var speed: float = 100.0
@export_range(1, 10) var knockback_on_hit: float = 1.0
@onready var hitbox: EnemyHitbox = $Hitbox
@onready var fire: GPUParticles2D = $Fire
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	fire.visible = false
	hitbox.received_damage.connect(on_received_damage)

func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio >= 1.0:
		queue_free()

func damage_percentage() -> float:
	return float(current_hit_points) / float(hit_points)

func on_received_damage():
	progress -= knockback_on_hit
	animation_player.play("hit")
	current_hit_points -= 1
	if(current_hit_points < hit_points):
		fire.visible = true
		fire.amount_ratio = 1 - damage_percentage()
		fire.speed_scale = 1 + damage_percentage() * 3
	if(current_hit_points <= 0):
		hitbox.destroyed = true
		explode()

func explode():
	GameManager.an_enemy_died(self)
	fire.reparent(get_parent())
	fire.one_shot = true
	var explosion = EXPLOSION.instantiate()
	get_parent().add_child(explosion)
	explosion.global_position = global_position
	var plane_falling = falling_scene.instantiate()
	get_parent().add_child(plane_falling)
	plane_falling.global_transform = global_transform
	queue_free()
