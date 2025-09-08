extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var cannon: Node2D
@onready var shoot_timer: Timer = $ShootTimer
@export var cannon_scene: PackedScene

var enemies = []
var can_shoot: bool = true

func _ready() -> void:
	cannon = cannon_scene.instantiate()
	add_child(cannon)
	area_2d.area_entered.connect(on_area_entered)
	area_2d.area_exited.connect(on_area_exited)

func on_area_entered(an_area: Area2D) -> void:
	enemies.push_back(an_area)

func on_area_exited(an_area: Area2D) -> void:
	enemies.erase(an_area)

func shoot() -> void:
	if enemies.is_empty():
		return
	can_shoot = false
	cannon.shoot()
	shoot_timer.start()
	await shoot_timer.timeout
	can_shoot = true

func _process(delta: float) -> void:
	if enemies.is_empty():
		return
	var closest_enemy = _closest_enemy()
	cannon.look_at(closest_enemy.global_position)
	if can_shoot:
		shoot()

func _closest_enemy() -> Node2D:
	var closest_enemy: Node2D = enemies.front()
	for enemy: Node2D in enemies:
		if enemy.global_position.distance_squared_to(global_position) < closest_enemy.global_position.distance_squared_to(global_position):
			closest_enemy = enemy
	return closest_enemy
