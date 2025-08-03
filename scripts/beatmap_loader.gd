extends Node

@export var note_speed := 800.0
@export var spawn_y := 0.0
@export var hit_y := 912.0

var travel_time = (hit_y - spawn_y) / note_speed

var beatmap: Array = []

func load_beatmap(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var result = JSON.parse_string(content)
		if typeof(result) == TYPE_DICTIONARY and result.has("error"):
			print("JSON parse error: ", result.error_string)
		elif typeof(result) == TYPE_ARRAY: #no error
			beatmap = result
		else:
			print("Unexpected JSON format.")
	else:
		print("Failed to open file: ", path)
