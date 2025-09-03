extends Node2D

const PLANE = preload("res://enemy/plane.tscn")

@onready var spawn_timer: Timer = $SpawnTimer
@export var routes: Array[Path2D]
@export var enemy_amount: int = 10

var enemies_left_to_spawn: int = 0
var horde_finished: bool = false

func _ready():
	enemies_left_to_spawn = enemy_amount
	spawn_timer.timeout.connect(self.spawn_enemy)

func spawn_enemy():
	if horde_finished:
		return
	var enemy = PLANE.instantiate()
	routes.pick_random().add_child(enemy)
	enemies_left_to_spawn -= 1
	if(enemies_left_to_spawn <= 0):
		horde_finished = true
