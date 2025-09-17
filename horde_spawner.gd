extends Node2D

@onready var spawn_timer: Timer = $SpawnTimer
@export var routes: Array[Path2D]
@export var possible_enemies: Array[PackedScene]
@export var enemy_amount: int = 10


var enemies_left_to_spawn: int = 0
var horde_finished: bool = false

func _ready():
	enemies_left_to_spawn = enemy_amount
	spawn_timer.timeout.connect(self.spawn_enemy)
	%WaveProgress.max_value = enemy_amount
	%WaveProgress.value = 0

func spawn_enemy():
	if horde_finished:
		return
	var enemy = possible_enemies.pick_random().instantiate()
	routes.pick_random().add_child(enemy)
	enemies_left_to_spawn -= 1
	%WaveProgress.value += 1
	if(enemies_left_to_spawn <= 0):
		horde_finished = true
	
