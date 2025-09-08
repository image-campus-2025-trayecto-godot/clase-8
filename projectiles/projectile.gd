class_name Projectile
extends Area2D

@export var velocity: Vector2 = Vector2.RIGHT
var impacted: bool = false

func _ready():
	area_entered.connect(on_area_entered)

func _process(delta: float) -> void:
	global_position += velocity * delta

func on_area_entered(area: EnemyHitbox) -> void:
	if impacted or area.destroyed:
		return
	impact(area)

func impact(enemy_hitbox: EnemyHitbox):
	impacted = true
	enemy_hitbox.was_shot()
	queue_free()

func be_shot(a_velocity) -> void:
	velocity = a_velocity
	rotation = a_velocity.angle()
