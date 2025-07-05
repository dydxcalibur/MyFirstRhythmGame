extends Node2D

@onready var audio_player = $AudioStreamPlayer2D
@onready var spawner = $NoteSpawner
@onready var beatmap_loader = $BeatmapLoader

var beatmap_index = 0

func _ready():
	#beatmap_loader.load_beatmap("res://beatmaps/0.json")
	#audio_player.play()
	spawner.spawn_note(1)
<<<<<<< HEAD
	pass
=======
>>>>>>> 8040c6e31b64fb798d23e7a41fcfdcbb040c9f87

var rng = RandomNumberGenerator.new()
func _process(delta):
	var lane_number = rng.randi_range(0, 3)
	spawner.spawn_note(lane_number)
