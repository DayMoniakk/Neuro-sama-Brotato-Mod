extends "res://ui/menus/pages/main_menu.gd"

func init() -> void :
	.init()
	get_node("LogoContainer/Logo").texture = load("res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/neuromod_ui_logo.png")
