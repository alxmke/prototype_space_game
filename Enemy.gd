extends Area2D

export var SPEED: float  = 20
export var ARMOR: float = 3

# Called when the node enters the scene tree for the first time.
# func _ready(): pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta): pass

func _physics_process(delta):
	position.x -= SPEED * delta
