extends Node

var beatmap: Array = []

func load_beatmap(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var result = JSON.parse_string(content)
		if result.error == OK:
			beatmap = result.result
		else:
			print("JSON parse error: ", result.error_string)
	else:
		print("Failed to open file: ", path)
