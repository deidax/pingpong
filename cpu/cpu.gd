extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : int
var p_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_pos = $"../Ball".position
	dist = position.y - ball_pos.y
	move_by = get_parent().PADDLE_SPEED * delta * (dist / abs(dist))
	
	position.y -= move_by
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
