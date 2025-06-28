extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_title_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_title.tscn")


func _on_song_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/in_game.tscn")
