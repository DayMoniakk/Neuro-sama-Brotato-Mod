extends Node

const AUTHORNAME_MODNAME_DIR := "DayMoniakk-NeuroMod"
const AUTHORNAME_MODNAME_LOG_NAME := "DayMoniakk-NeuroMod:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

func _init(modLoader = ModLoader) -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)

	# load config
	var config_handler = load(mod_dir_path + "/config_handler.gd").new()
	config_handler.name = "ConfigHandler"
	add_child(config_handler)

	# Add extensions
	install_script_extensions(modLoader)
	# Add translations
	add_translations()

func install_script_extensions(modloader: ModLoader) -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	modloader.install_script_extension(extensions_dir_path + "/music_manager.gd")
	modloader.install_script_extension(extensions_dir_path + "/main_menu.gd")
	modloader.install_script_extension(extensions_dir_path + "/title_screen.gd")
	modloader.install_script_extension(extensions_dir_path + "/player.gd")
	modloader.install_script_extension(extensions_dir_path + "/temp_stats.gd")
	modloader.install_script_extension(extensions_dir_path + "/entity_service.gd")


func add_translations() -> void:
	translations_dir_path = mod_dir_path.plus_file("translations")
	ModLoaderMod.add_translation(translations_dir_path.plus_file("/neuromod_text.en.translation"))
	ModLoaderMod.add_translation(translations_dir_path.plus_file("/neuromod_text.zh.translation"))


func _ready() -> void:
	ModLoaderLog.info("Ready!", AUTHORNAME_MODNAME_LOG_NAME)
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	ContentLoader.load_data(mod_dir_path + "/content_data/neuromod_content.tres", AUTHORNAME_MODNAME_DIR)
