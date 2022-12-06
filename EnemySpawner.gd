extends Node2D

const Enemy = preload("res://Enemy.tscn")

onready var spawn_points = $SpawnPoints
onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta): pass

func get_spawn_position():
	var points = spawn_points.get_children()
	return points[randi() % len(points)].global_position

func spawn_enemy():
	var spawn_position = get_spawn_position()
	var enemy = Enemy.instance()
	enemy.global_position = spawn_position
	var world = get_tree().current_scene
	world.add_child(enemy)
	
func _on_Timer_timeout():
	spawn_enemy()
	timer.start()
