extends PathFollow2D

@export_range(1, 1000, 1) var speed: float = 100.0
@onready var hitbox: EnemyHitbox = $Hitbox

func _ready() -> void:
	hitbox.received_damage.connect(on_received_damage)

func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio >= 1.0:
		queue_free()

func on_received_damage():
	hitbox.destroyed = true
	queue_free()
