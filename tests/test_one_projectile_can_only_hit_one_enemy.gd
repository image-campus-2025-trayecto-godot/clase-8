extends Node2D

const PROJECTILE = preload("res://projectiles/projectile.tscn")
const PLANE = preload("res://enemy/plane.tscn")


func run_test() -> void:
	var projectile = PROJECTILE.instantiate()
	add_child(projectile)
	var enemy = PLANE.instantiate()
	add_child(enemy)
	var enemy_2 = PLANE.instantiate()
	add_child(enemy_2)
	
	projectile.on_area_entered(enemy.hitbox)
	projectile.on_area_entered(enemy_2.hitbox)
	
	await get_tree().process_frame
	
	var there_is_only_one_enemy_left = get_children() == [enemy_2]
	print_rich("[b]%s[/b]" % name)
	if(there_is_only_one_enemy_left):
		print_rich("[color=green]Test passed![/color]")
	else:
		print_rich("[color=red]Test failed :(, the remaining nodes were %s[/color]" % [get_children()])
