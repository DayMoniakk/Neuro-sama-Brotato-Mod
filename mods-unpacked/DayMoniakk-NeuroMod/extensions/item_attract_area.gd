extends "res://entities/units/player/item_attract_area.gd"

export var range_multiplier := 2.0

func _ready()->void :
	$CollisionShape2D.shape.radius = max(30, BASE_RADIUS * range_multiplier)
