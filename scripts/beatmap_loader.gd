extends Node

var beatmap: Array = []

func load_beatmap(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var result = JSON.parse_string(content)
		if typeof(result) == TYPE_DICTIONARY and result.has("error"):
			print("JSON parse error: ", result.error_string)
		elif typeof(result) == TYPE_ARRAY:
			beatmap = result
		else:
			print("Unexpected JSON format.")
	else:
		print("Failed to open file: ", path)
