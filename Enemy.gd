extends Area2D

export var SPEED: float = 20
export var ARMOR: float = 3

signal killed

const ExplosionEffect = preload("res://ExplosionEffect.tscn")
const LaserHitEffect = preload("res://LaserHitEffect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var world = get_tree().current_scene
	# if world.is_in_group("World") doesn't work?
	if world.get_name() == 'World':
		# warning-ignore:return_value_discarded
		connect('killed', world, '_on_Enemy_killed')

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta): pass

func _physics_process(delta):
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body):
	body.queue_free()
	ARMOR -= 1
	laser_hit_effect()
	if ARMOR <= 0:
		emit_signal('killed')
		explode()

func laser_hit_effect():
	var laser_hit_effect = LaserHitEffect.instance()
	laser_hit_effect.global_position = global_position
	var world = get_tree().current_scene
	world.add_child(laser_hit_effect)

func explode():
	var explosion_effect = ExplosionEffect.instance()
	explosion_effect.global_position = global_position
	var world = get_tree().current_scene
	world.add_child(explosion_effect)
	queue_free()
