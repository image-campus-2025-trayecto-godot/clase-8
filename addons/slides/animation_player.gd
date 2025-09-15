@tool
extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	(get_parent() as CanvasItem).visibility_changed.connect(func():
		if(get_parent().is_visible()):
			play("new_animation")
	)
