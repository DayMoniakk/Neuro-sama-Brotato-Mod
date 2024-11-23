extends "res://singletons/music_manager.gd"

const ENABLE_CUSTOM_MUSIC_NAME := "Enable Custom Music"

var config_handler: Node
var settings: Dictionary

var original_tracks: Array
var custom_tracks: Array
var use_custom_tracks := true

func _ready() -> void:
	fill_tracks()

	yield(get_tree(), "idle_frame") # waiting 1 frame in case the config file is not loaded yet

	config_handler = get_node_or_null("/root/ModLoader/DayMoniakk-NeuroMod/ConfigHandler")
	if config_handler:
		settings = config_handler.get_settings()
		config_handler.connect("setting_changed", self, "on_setting_changed")

		use_custom_tracks = settings[ENABLE_CUSTOM_MUSIC_NAME]
		set_shuffled_tracks()

func on_setting_changed(setting_name: String, value) -> void:
	if setting_name == ENABLE_CUSTOM_MUSIC_NAME:
		config_handler.set_setting(ENABLE_CUSTOM_MUSIC_NAME, value)
		use_custom_tracks = value
		set_shuffled_tracks()

func set_shuffled_tracks() -> void:
	if use_custom_tracks:
		shuffled_tracks = custom_tracks
		shuffled_tracks.shuffle()
	else:
		.set_shuffled_tracks()

	on_track_finished()

func fill_tracks() -> void:
	original_tracks = shuffled_tracks

	print("[NeuroMod-CustomMusic] " + "Attempting to load custom music tracks...")
	var music_dir_path := "res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/music/"
	var dir := Directory.new()

	if not dir.dir_exists(music_dir_path):
		print("[NeuroMod-CustomMusic] " + "Aborting custom music tracks loading, the directory was not found.")
		return

	print("[NeuroMod-CustomMusic] " + "Opening custom music tracks folder...")
	dir.open(music_dir_path)
	dir.list_dir_begin()

	var file := dir.get_next()
	while file != "":
		if file.get_extension() == "mp3":
			custom_tracks.append(load(music_dir_path.plus_file(file)))

		file = dir.get_next()

	dir.list_dir_end()
	print("[NeuroMod-CustomMusic] " + "Successfully loaded custom music tracks !")
