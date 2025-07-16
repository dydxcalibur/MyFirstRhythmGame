extends Node

var score := 0
var combo := 0

func register_hit(accuracy: String):
	match accuracy:
		"perfect":
			score += 100
			combo += 1
		"good":
			score += 50
			combo += 1
		"miss":
			combo = 0

	print("Hit: %s | Score: %d | Combo: %d" % [accuracy, score, combo])
