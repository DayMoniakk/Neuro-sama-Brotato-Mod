extends "res://entities/structures/turret/turret.gd"

export var min_player_dist := 150.0
export var move_speed := 2.0
export var acceleration := 0.02
export var stop_friction := 0.05

var player: Node2D
var velocity := Vector2.ZERO

func _ready() -> void:
	._ready()

	yield(get_tree(), "idle_frame")
	player = TempStats.player_nodes[player_index]

func _physics_process(delta: float) -> void:
	._physics_process(delta)

	var player_pos := player.global_position
	var curr_pos := global_position
	var dir := player_pos - curr_pos

	if _current_target.size() > 0 and is_instance_valid(_current_target[0]):
		dir = _current_target[0].global_position - curr_pos

	if curr_pos.distance_to(player_pos) > min_player_dist:
		velocity = velocity.linear_interpolate(dir, acceleration)
	else:
		velocity = velocity.linear_interpolate(Vector2.ZERO, stop_friction)

	linear_velocity = velocity * move_speed
