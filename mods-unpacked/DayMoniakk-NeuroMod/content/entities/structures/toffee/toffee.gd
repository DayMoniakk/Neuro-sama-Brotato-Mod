extends Structure

export var min_player_dist := 100.0
export var move_speed := 1.5

var consumables_in_range: = []
var player: Node2D
var current_stats: LiveStats
var max_stats:LiveStats

var velocity: Vector2

onready var toffee_sprite := $"Animation/Sprite"
onready var _slow_hitbox = $SlowHitbox

func _ready() -> void:
	._ready()
	_slow_hitbox.deals_damage = false
	player = TempStats.player
	player.connect("updated_stats", self, "refresh_player_stats")
	refresh_player_stats()

func _physics_process(_delta: float) -> void:
	var player_pos := player.global_position
	var curr_pos := global_position
	var dir := player_pos - curr_pos

	if curr_pos.distance_to(player_pos) > min_player_dist: velocity = dir
	else: velocity = Vector2.ZERO

	move_and_slide(velocity * move_speed)
	toffee_sprite.flip_h = curr_pos.x > player_pos.x

func _on_ItemPickupArea_area_entered(area: Area2D) -> void:
	area.attracted_by = player
	area.pickup()

	if consumables_in_range.has(area):
		consumables_in_range.erase(area)

func _on_ItemAttractArea_area_entered(area: Area2D) -> void:
	var is_heal = area is Consumable

	if is_heal and current_stats.health >= max_stats.health:
		consumables_in_range.push_back(area)
	elif not is_heal or (is_heal and current_stats.health < max_stats.health):
		area.attracted_by = self

func _on_ItemAttractArea_area_exited(area: Area2D) -> void:
	var is_heal = area is Consumable

	if is_heal and consumables_in_range.has(area):
		consumables_in_range.erase(area)

func die(_knockback_vector:Vector2 = Vector2.ZERO, p_cleaning_up:bool = false)->void :
	$Animation/Sprite.scale = Vector2(0.075, 0.075)
	.die(_knockback_vector, p_cleaning_up)
	$Animation/Sprite.scale = Vector2(0.075, 0.075)

func refresh_player_stats() -> void:
	current_stats = player.current_stats
	max_stats = player.max_stats


func _on_SlowHitbox_hit_something(thing_hit, _damage_dealt) -> void:
	thing_hit.add_decaying_speed( - 250)
	thing_hit.emit_signal("speed_removed", thing_hit)
