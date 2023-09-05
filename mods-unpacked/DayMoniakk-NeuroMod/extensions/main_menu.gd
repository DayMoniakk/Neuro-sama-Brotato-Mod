extends "res://ui/menus/pages/main_menu.gd"

func _ready() -> void:
	get_node("Logo").texture = load("res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/neuromod_ui_logo.png")
