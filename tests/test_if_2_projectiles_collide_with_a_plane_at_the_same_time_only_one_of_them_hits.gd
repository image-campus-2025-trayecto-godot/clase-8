extends Node2D

const PROJECTILE = preload("res://projectiles/projectile.tscn")
const PLANE = preload("res://enemy/plane.tscn")

func run_test() -> void:
	var projectile = PROJECTILE.instantiate()
	add_child(projectile)
	var projectile_2 = PROJECTILE.instantiate()
	add_child(projectile_2)
	var enemy = PLANE.instantiate()
	add_child(enemy)
	
	projectile.on_area_entered(enemy.hitbox)
	projectile_2.on_area_entered(enemy.hitbox)
	
	await get_tree().process_frame
	
	var there_is_only_one_projectile_left = get_children() == [projectile_2]
	print_rich("[b]%s[/b]" % name)
	if(there_is_only_one_projectile_left):
		print_rich("[color=green]Test passed![/color]")
	else:
		print_rich("[color=red]Test failed :(, the remaining nodes were %s[/color]" % [get_children()])
