extends Node2D

@onready var audio_player = $AudioStreamPlayer2D
@onready var spawner = $NoteSpawner
@onready var beatmap_loader = $BeatmapLoader

var beatmap_index = 0

func _ready():
	beatmap_loader.load_beatmap("res://beatmaps/0.json")
	print("Loaded beatmap: ", beatmap_loader.beatmap)
	for note_data in beatmap_loader.beatmap:
		print("Time:", note_data["time"], " Lane:", note_data["lane"])
	audio_player.play()
	#spawner.spawn_note(1)

var rng = RandomNumberGenerator.new()
func _process(delta):
	var current_time = audio_player.get_playback_position()
	while beatmap_index < beatmap_loader.beatmap.size():
		var note_data = beatmap_loader.beatmap[beatmap_index]
		if current_time >= note_data["time"]:
			spawner.spawn_note(note_data["lane"])
			beatmap_index += 1
		else:
			break
