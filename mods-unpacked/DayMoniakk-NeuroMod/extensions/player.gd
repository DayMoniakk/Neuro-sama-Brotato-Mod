extends Player

const anny_hurt := [
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/anny/neuromod_hic.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/anny/neuromod_iff iff.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/anny/neuromod_mhm.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/anny/neuromod_nya.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/anny/neuromod_uwu.mp3"
]

const evil_hurt := [
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_bleh.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_evilfrick.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_evilKEK.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_evilyarr.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_HEH.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_noise_10.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_oh_1.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_oh_2.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_ow.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_pain.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_twitchy.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_uhh.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_why.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/evil_neuro/neuromod_why_2.mp3"
]

const hiyori_hurt := [
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/hiyori/neuromod_filtered.mp3"
]

const neuro_hurt := [
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/neuro_sama/neuromod_erm.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/neuro_sama/neuromod_gymbag.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/neuro_sama/neuromod_neuro_aaaaaa.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/neuro_sama/neuromod_neuro_ha.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/neuro_sama/neuromod_no.mp3"
]

const teru_hurt := [
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/teru/neuromod_teru_1.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/teru/neuromod_teru_2.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/teru/neuromod_teru_3.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/teru/neuromod_teru_5.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/teru/neuromod_teru_6.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/teru/neuromod_teru_7.mp3"
]

const vedal_hurt := [
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_1.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_2.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_3.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_4.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_5.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_6.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_7.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_8.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_9.mp3",
	"res://mods-unpacked/DayMoniakk-NeuroMod/content/resources/sounds/vedal/neuromod_vedal_noise_10.mp3"
]

func _ready() -> void:
	TempStats.register_player_node(self, player_index)

	var current_character = RunData.get_player_character(player_index)

	match current_character.my_id:
		"neuromod-anny":
			hurt_sounds = get_sound_array(anny_hurt)
		"neuromod-evil_neuro":
			hurt_sounds = get_sound_array(evil_hurt)
		"neuromod-hiyori":
			hurt_sounds = get_sound_array(hiyori_hurt)
		"neuromod-neuro_sama":
			hurt_sounds = get_sound_array(neuro_hurt)
		"neuromod-teru":
			hurt_sounds = get_sound_array(teru_hurt)
		"neuromod-vedal":
			hurt_sounds = get_sound_array(vedal_hurt)

func get_sound_array(paths: Array) -> Array:
	var output := []
	for path in paths: output.append(load(path))
	return output

func update_player_stats(reset_current_health: = false) -> void:
	.update_player_stats(reset_current_health)
