extends Area2D

export var SPEED: float = 100

const Laser = preload("res://Laser.tscn")
onready var laser_timer = $LaserTimer
export var fire_speed: float = 0.25 # seconds
# Called when the node enters the scene tree for the first time.
# func _ready(): pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta): pass
var fire_ready: bool = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
	if Input.is_action_pressed("fire") and fire_ready:
		fire_laser()

func fire_laser():
	var bullet = Laser.instance()
	var world = get_tree().current_scene
	bullet.global_position = global_position
	world.add_child(bullet)
	fire_ready = false
	laser_timer.start(fire_speed)

func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()


func _on_LaserTimer_timeout():
	fire_ready = true
