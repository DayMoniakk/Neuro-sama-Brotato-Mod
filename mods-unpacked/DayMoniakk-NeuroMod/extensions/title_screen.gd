extends "res://ui/menus/title_screen/title_screen.gd"

# Yes I know it's a dirty way of doing it but it's better for performance
# than scanning the whole folder every time the main menu is shown
const splash_sprites := [
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_0.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_1.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_2.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_3.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_4.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_5.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_6.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_7.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_8.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_9.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_10.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_11.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_12.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_13.png",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/ui/menus/title_screen/splash_art/neuromod_splash_14.png"
]

func reload_background() -> void:
	.reload_background()
	yield(get_tree(), "idle_frame")

	var base_character = get_node_or_null("AnimatedBackgroundContainer/BaseTitleScreenBackground/BackgroundBrotato")
	if base_character:
		base_character.texture = load(splash_sprites[randi() % splash_sprites.size()])
	else:
		var dlc_character = get_node("AnimatedBackgroundContainer").get_child(0).get_node_or_null("Brotato_Centered")
		if dlc_character:
			dlc_character.texture = load(splash_sprites[randi() % splash_sprites.size()])
			dlc_character.material = load("res://mods-unpacked/DayMoniakk-NeuroMod/offset_mat.tres")
