extends Node2D

@onready var audio_player = $AudioStreamPlayer2D
@onready var spawner = $NoteSpawner
@onready var beatmap_loader = $BeatmapLoader

var beatmap_index = 0

var time_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func _ready():
	beatmap_loader.load_beatmap("res://beatmaps/0.json")
	print("Loaded beatmap: ", beatmap_loader.beatmap)

	audio_player.play()
	#spawner.spawn_note(1)

var rng = RandomNumberGenerator.new()
func _process(delta):
	var current_time = audio_player.get_playback_position()
	if beatmap_index < len(time_arr):
		if current_time >= time_arr[beatmap_index]:
			var lane_number = rng.randi_range(0, 3)
			spawner.spawn_note(lane_number)
			if beatmap_index <= len(time_arr)-1:
				beatmap_index += 1
