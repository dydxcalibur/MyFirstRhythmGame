extends Node2D

@onready var audio_player = $AudioStreamPlayer2D
@onready var spawner = $NoteSpawner
@onready var beatmap_loader = $BeatmapLoader
@onready var timer: Timer = $Timer

var note_speed := 800.0
var spawn_y := 0.0
var judge_y := 912.0
var travel_time := (judge_y - spawn_y) / note_speed
var music_delay := 2.0  # seconds
var spawn_times : Array[float] = []

var beatmap_index := 0
var music_started := false
var pretime := 2.0


func _ready():
	timer.start()
	beatmap_loader.load_beatmap("res://beatmaps/0.json")
	print("Loaded beatmap: ", beatmap_loader.beatmap)
	for note_data in beatmap_loader.beatmap:
		print("Time:", note_data["time"], " Lane:", note_data["lane"])
		spawn_times.append(note_data["time"] - travel_time)
		print(spawn_times)
	#spawner.spawn_note(1)

func _process(delta):
	
	if not music_started and timer.is_stopped():
		audio_player.play()
		music_started = true
	
	if not music_started and (not timer.is_stopped()):
		pretime = timer.get_time_left()
		print(pretime)
		if spawn_times[beatmap_index] < 0:
			print(spawn_times[beatmap_index])
			var note_data = beatmap_loader.beatmap[beatmap_index]
			var pre_spawn_time = spawn_times[beatmap_index] * -1
			if pretime < pre_spawn_time:
				spawner.spawn_note(note_data["lane"])
				beatmap_index += 1
	
	if music_started:
		var current_time = audio_player.get_playback_position()
		print(current_time)
		while beatmap_index < beatmap_loader.beatmap.size():
			var note_data = beatmap_loader.beatmap[beatmap_index]
			if current_time >= spawn_times[beatmap_index]:
				spawner.spawn_note(note_data["lane"])
				beatmap_index += 1
			else:
				break
