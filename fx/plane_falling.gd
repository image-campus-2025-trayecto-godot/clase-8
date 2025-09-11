extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	animation_player.play("falling")
	await animation_player.animation_finished
	queue_free()
