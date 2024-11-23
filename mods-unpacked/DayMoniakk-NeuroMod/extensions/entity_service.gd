extends "res://singletons/entity_service.gd"

func sort_turrets_by_strength(a: TurretEffect, b: TurretEffect) -> bool:
	var ordering: = ["effect_builder_turret_alt", "effect_turret_rocket", "effect_turret_laser", "effect_tyler",
	"effect_turret_flame", "effect_turret", "effect_turret_healing",
	"effect_swarm_drone_rounded", "effect_swarm_drone_neko", "effect_swarm_drone_heart", "effect_swarm_drone_explosive"]

	var a_index: = ordering.find(a.text_key)
	var b_index: = ordering.find(b.text_key)
	assert (a_index != - 1, "turret ordering is missing key %s" % a.text_key)
	assert (b_index != - 1, "turret ordering is missing key %s" % b.text_key)
	return a_index <= b_index
