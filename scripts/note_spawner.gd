extends Node2D

@export var note_scene: PackedScene
@export var track_positions: Array[Vector2]


func spawn_note(lane: int):
	var note = note_scene.instantiate()
	note.position = track_positions[lane]
	note.lane = lane
	add_child(note)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
