extends Area2D

const SHAPE_WIDTH := 16
const ROTATION_ANGLE := 90
var _screen_size := Vector2.ZERO
enum GOAL {LEFT, RIGHT}
export (GOAL) var goal_side = GOAL.LEFT


func _init():
    pass


func _ready() -> void:
    _screen_size = get_viewport_rect().size
    $GoalShape.get_shape().extents = Vector2(_screen_size.x / 2, SHAPE_WIDTH)

    match goal_side:
        GOAL.LEFT:
            $GoalShape.position = Vector2(-SHAPE_WIDTH, _screen_size.x / 2)
        GOAL.RIGHT:
            $GoalShape.position = Vector2(SHAPE_WIDTH + _screen_size.x, _screen_size.x / 2)
