extends "res://singletons/temp_stats.gd"

var player_nodes := {}

func register_player_node(player_node: Node2D, player_index: int) -> void:
	player_nodes[player_index] = player_node
