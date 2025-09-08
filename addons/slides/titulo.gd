@tool
extends Control

@export var titulo: String :
	set(nuevo_titulo):
		titulo = nuevo_titulo
		if is_inside_tree():
			var hijo = get_child(0)
			if hijo is Label:
				hijo.text = titulo
				hijo.name = titulo
				name = titulo
