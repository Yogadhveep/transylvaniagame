extends Node2D  # Ensure this is Node2D, which supports drawing functions in 4.x

var circle_color = Color(1, 0, 0)  # Initial color (red)
var radius = 25
var highlight = Color(1, 1, 0)
var is_selected = false

func _ready():
	queue_redraw()  # Trigger the _draw function on startup in Godot 4.x

func _draw():
	if is_selected:
		draw_circle(Vector2(0, 0), radius, highlight)
		draw_circle(Vector2(0, 0), radius-5, circle_color)
	else:
		draw_circle(Vector2(0, 0), radius, circle_color)

# Method to change the circle color
func set_circle_color(new_color: Color, id):
	circle_color = new_color
	$Label.text = str(id)
	queue_redraw()  # Redraw the circle with the new color in Godot 4.x

var node : int

func set_pos(pos):
	node = pos

func get_pos():
	return node

func selected(is_it):
	is_selected = is_it
	queue_redraw()
