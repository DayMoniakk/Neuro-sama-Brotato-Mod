extends "res://ui/menus/pages/main_menu.gd"

func init() -> void :
	.init()
	var dlc_title_logo := get_node_or_null("LogoContainer/Logo/TextureRect")
	if dlc_title_logo == null:
		var regular_title_logo := get_node_or_null("LogoContainer/Logo")
		if regular_title_logo != null:
			regular_title_logo.texture = load("res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/neuromod_ui_logo.png")
	else:
		dlc_title_logo.texture = load("res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/neuromod_ui_logo.png")
