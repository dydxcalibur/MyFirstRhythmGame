extends Node2D

@export var tap_note_scene: PackedScene
var track_positions = [595, 838, 1082, 1325]


func spawn_note(lane: int):
<<<<<<< HEAD
	var note = tap_note_scene.instantiate()
	note.position.x = track_positions[lane]
	add_child(note)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
=======
	var tap = tap_note_scene.instantiate()
	tap.position.x = track_positions[lane]
	tap.lane = lane
	add_child(tap)
>>>>>>> 8040c6e31b64fb798d23e7a41fcfdcbb040c9f87
