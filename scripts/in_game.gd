extends Node2D

@onready var audio_player = $AudioStreamPlayer
@onready var spawner = $NoteSpawner
#@onready var beatmap_loader = $BeatmapLoader

var beatmap_index = 0

func _ready():
	#beatmap_loader.load_beatmap("res://beatmap.json")
	#audio_player.play()
	spawner.spawn_note(1)
	pass

func _process(delta):
	pass
