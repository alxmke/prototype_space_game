extends Node

onready var highscore = $Highscore

# Called when the node enters the scene tree for the first time.
func _ready():
	var save_data = Storage.from_file()
	highscore.text = "highscore: " + str(save_data.highscore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://World.tscn")
	elif Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
