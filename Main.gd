extends Node2D

var score := [0, 0]
var Racket := preload("res://racket/racket.tscn")
var Goal := preload("res://goal/Goal.tscn")
var _screen_size := Vector2.ZERO


func _init():
    randomize()


func _ready():
    _screen_size = get_viewport_rect().size
    spawn_rackets()
    spawn_walls()


func spawn_walls():
    var top_wall := StaticBody2D.new()
    var top_wall_poly := CollisionPolygon2D.new()
    top_wall_poly.polygon = PoolVector2Array([Vector2(0, 0), Vector2(0, -16), Vector2(_screen_size.x, -16), Vector2(_screen_size.x, 0)])
    top_wall.add_child(top_wall_poly)
    top_wall.name = "top_wall"
    self.add_child(top_wall)

    var bottom_wall := StaticBody2D.new()
    var bottom_wall_poly := CollisionPolygon2D.new()
    bottom_wall_poly.polygon = PoolVector2Array([Vector2(0, _screen_size.y), Vector2(_screen_size.x, _screen_size.y), Vector2(_screen_size.x, 768), Vector2(0, _screen_size.y)])
    bottom_wall.add_child(bottom_wall_poly)
    bottom_wall.name = "borrom_wall"
    self.add_child(bottom_wall)


func spawn_rackets():
    var player_racket := Racket.instance()
    player_racket.initialize(Vector2(32, _screen_size.y / 2), Color(1, 0, 0))
    self.add_child(player_racket)

    var ai_racket := Racket.instance()
    ai_racket.initialize(Vector2(992, _screen_size.y / 2), Color(0, 1, 0))
    self.add_child(ai_racket)
