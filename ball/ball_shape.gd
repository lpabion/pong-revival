extends Node2D

var ball_coords = Vector2(512, 320)

func _draw():

    ball_coords.x += 1
    draw_circle(ball_coords, 10, ColorN("White"))

func _process(delta):
    update()
    move_and_slide
