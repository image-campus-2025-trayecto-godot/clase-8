extends Node2D

func _ready() -> void:
	print_rich("[font_size=25]Running tests from %s[/font_size]" % name)
	for test in get_children():
		await test.run_test()
		print("\n")
