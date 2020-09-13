extends KinematicBody2D

var speed = 200
var velocity = Vector2(0, 0)

func _ready():
    pass # Replace with function body.

func _process(delta):
    velocity = Vector2(0, 0)
    if Input.is_action_pressed("ui_up"):
        velocity.y -= speed
    if Input.is_action_pressed("ui_down"):
        velocity.y += speed

    move_and_slide(velocity)
