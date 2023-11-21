extends CharacterBody2D


var win_size : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int
var dir : Vector2

func _ready():
	win_size = get_viewport_rect().size
	
func new_ball():
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	dir = random_dir()
	print("------BALL")

func random_dir():
	var new_dir = Vector2.ZERO
	new_dir.x = [-1, 1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

func _physics_process(delta):
	move_and_collide(dir * speed * delta)

