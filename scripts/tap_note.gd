extends Node2D

@export var speed: float = 800.0 #pixels per second
@export var lane: int



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > 1080: # Destroy note when it is off-screen
		queue_free() 



func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
