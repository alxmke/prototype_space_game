extends Area2D

export var SPEED: float = 100

const Bullet = preload("res://Bullet.tscn")

# Called when the node enters the scene tree for the first time.
# func _ready(): pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta): pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
	if Input.is_action_just_pressed("ui_accept"):
		fire_bullet()

func fire_bullet():
	var bullet = Bullet.instance()
	var world = get_tree().current_scene
	bullet.global_position = global_position
	world.add_child(bullet)


func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()
