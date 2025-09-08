extends Projectile

const ROCKET_EXPLOSION = preload("res://projectiles/rocket_explosion.tscn")

func impact(enemy_hitbox: EnemyHitbox):
	super.impact(enemy_hitbox)
	var rocket_explosion = ROCKET_EXPLOSION.instantiate()
	add_sibling.call_deferred(rocket_explosion)
	rocket_explosion.global_position = global_position
