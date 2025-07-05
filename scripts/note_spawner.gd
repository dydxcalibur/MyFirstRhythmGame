extends Node2D

@export var tap_note_scene: PackedScene
var track_positions = [595, 838, 1082, 1325]


func spawn_note(lane: int):
	var tap = tap_note_scene.instantiate()
	tap.position.x = track_positions[lane]
	tap.lane = lane
	add_child(tap)
