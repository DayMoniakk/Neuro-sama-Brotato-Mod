extends Node

signal setting_changed(setting_name, value)

const MOD_NAME := "DayMoniakk-NeuroMod"
const CONFIG_NAME = "config_created_by_mod_options"

const DEFAULT_SETTINGS: = {
	"Enable Custom Music": true
	}

var ModsConfigInterface
var config:ModConfig = null
var _current_settings: Dictionary = DEFAULT_SETTINGS.duplicate()

func _ready() -> void:
	try_load_config()

func try_load_config() -> void:
	ModsConfigInterface = get_node_or_null("/root/ModLoader/dami-ModOptions/ModsConfigInterface")
	if not ModsConfigInterface: return

	var configs = ModLoaderConfig.get_configs(MOD_NAME)

	if configs.has(CONFIG_NAME):
		config = ModLoaderConfig.get_config(MOD_NAME, CONFIG_NAME)
	else:
		config = ModLoaderConfig.create_config(MOD_NAME, CONFIG_NAME, DEFAULT_SETTINGS)

	if config:
			var _error_config = ModLoaderConfig.update_config(config)
			var data = config.data
			for key in _current_settings.keys():
				_current_settings[key] = data[key]

	ModsConfigInterface.connect("setting_changed", self, "on_setting_changed")
	init_settings()

func init_settings()->void :
	for key in _current_settings.keys():
		ModsConfigInterface.on_setting_changed(key, _current_settings[key], MOD_NAME)

func on_setting_changed(setting_name:String, value, mod_name:String) -> void:
	if mod_name == MOD_NAME:
		_current_settings[setting_name] = value

		if config:
			emit_signal("setting_changed", setting_name, value)

func load_settings()->Dictionary :
	return get_settings()

func get_settings()->Dictionary :
	if not ModsConfigInterface:
		return DEFAULT_SETTINGS

	return _current_settings

func set_setting(setting_name: String, value) -> void:
	if config:
		config.data[setting_name] = value
		ModLoaderConfig.update_config(config)
