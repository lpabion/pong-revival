extends KinematicBody2D

var _screen_size := Vector2.ZERO
var initial_position := Vector2.ZERO
var initial_ball_speed := 300
var ball_speed := initial_ball_speed
var hit_counter := 0
var speed_bonus_hit_counter := 10
var starting_velocity := Vector2()
var ball_velocity := Vector2()


func _ready():
    _screen_size = get_viewport_rect().size
    initial_position = Vector2(_screen_size.x / 2, _screen_size.y / 2)
    position = initial_position
    starting_velocity = get_initial_ball_velocity()
    ball_velocity = starting_velocity.normalized() * ball_speed


func random_number(min_val: float, max_val: float) -> float:
    var value := rand_range(min_val, max_val)
    return value


func get_initial_ball_velocity() -> Vector2:
    var x_flip_coin := random_number(-1.0, 1.0)

    if x_flip_coin < 0:
        x_flip_coin = -1
    else:
        x_flip_coin = 1

    return Vector2(int(random_number(100.0,200.0)), int(random_number(100.0, 200.0))) * x_flip_coin


func _physics_process(delta):
    $ball_stats.text = str(ball_velocity)
    var collision := move_and_collide(ball_velocity * delta)

    if collision:
        ball_velocity = ball_velocity.bounce(collision.normal)
        if collision.collider.is_in_group("rackets"):
            var y := ball_velocity.y / 3 +  collision.collider_velocity.y
            hit_counter += 1
            ball_velocity = Vector2(ball_velocity.x, y).normalized() * (ball_speed + hit_counter * speed_bonus_hit_counter)


func reset():
    position = initial_position
    hit_counter = 0
    starting_velocity = get_initial_ball_velocity()
    ball_velocity = starting_velocity.normalized() * ball_speed


func _on_left_goal_body_entered(body: Node) -> void:
    get_parent().score[0] += 1
    reset()


func _on_right_goal_body_entered(body: Node) -> void:
    get_parent().score[1] += 1
    reset()
