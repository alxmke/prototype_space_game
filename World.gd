extends Node2D

var score: float = 0 setget set_score

onready var score_label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
# func _ready(): pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta): pass

func set_score(value):
	score = value
	score_label.text = 'Score = ' + str(score)

func _on_Enemy_killed():
	self.score += 10


func _on_Ship_game_over():
	yield(get_tree().create_timer(3), "timeout")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://EndMenu.tscn")
