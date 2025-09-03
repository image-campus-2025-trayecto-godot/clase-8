extends PathFollow2D

@export_range(1, 1000, 1) var speed: float = 100.0

func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio >= 1.0:
		queue_free()
