extends Node

@export var note_speed := 800.0
@export var spawn_y := 0.0
@export var hit_y := 912.0


var bpm: float = 120.0
var offset: float = 0.0
var lanes: int = 4
var beatmap: Array = []

func load_beatmap(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var result = JSON.parse_string(content)
		if result is Dictionary:
			bpm = result.get("bpm", 120.0)
			offset = result.get("offset", 0.0)
			lanes = result.get("lanes", 4)
			beatmap = result.get("beatmap", [])
			print("Loaded beatmap: ", result.get("title", "Unknown"), " by ", result.get("artist", "Unknown"))
			print("Notes loaded: ", beatmap.size())
		elif result.has("error"):
			print("JSON parse error: ", result.error_string)
		else:
			print("Unexpected JSON format.")
	else:
		print("Failed to open file: ", path)
		
