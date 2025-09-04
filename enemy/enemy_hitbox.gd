class_name EnemyHitbox
extends Area2D

signal received_damage

var destroyed: bool = false

func was_shot() -> void:
	received_damage.emit()
