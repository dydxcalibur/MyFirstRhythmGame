extends Node

@export var hit_zones: Array[Area2D]  # One per lane
@export var hit_window_good := 50.0
@export var hit_window_perfect := 20.0

@onready var score_manager = $ScoreManager

func _input(event):
	var key_map = {
		"track_0": 0,
		"track_1": 1,
		"track_2": 2,
		"track_3": 3
	}

	for action in key_map.keys():
		if event.is_action_pressed(action):
			var lane = key_map[action]
			check_hit(lane)


func check_hit(lane: int):
	var zone_y = hit_zones[lane].global_position.y
	var closest_note = null
	var closest_distance = INF

	for note in get_tree().get_nodes_in_group("notes"):
		if note.lane == lane:
			var distance = abs(note.global_position.y - zone_y)
			if distance < closest_distance:
				closest_distance = distance
				closest_note = note

	if closest_note:
		if closest_distance <= hit_window_perfect:
			score_manager.register_hit("perfect")
			closest_note.queue_free()
		elif closest_distance <= hit_window_good:
			score_manager.register_hit("good")
			closest_note.queue_free()
		else:
			score_manager.register_hit("miss")
	else:
		score_manager.register_hit("miss")
