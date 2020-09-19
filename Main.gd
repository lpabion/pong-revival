extends Node2D

var score := [0, 0]
var Racket := preload("res://racket/racket.tscn")
var Goal := preload("res://goal/Goal.tscn")


func _init():
    randomize()


func _ready():
    spawn_rackets()
    spawn_walls()


func spawn_walls():
    var top_wall := StaticBody2D.new()
    var top_wall_poly := CollisionPolygon2D.new()
    top_wall_poly.polygon = PoolVector2Array([Vector2(0, 0), Vector2(0, -16), Vector2(1024, -16), Vector2(1024, 0)])
    top_wall.add_child(top_wall_poly)
    self.add_child(top_wall)

    var bottom_wall := StaticBody2D.new()
    var bottom_wall_poly := CollisionPolygon2D.new()
    bottom_wall_poly.polygon = PoolVector2Array([Vector2(0, 768), Vector2(1024, 768), Vector2(1024, 768), Vector2(0, 768)])
    bottom_wall.add_child(bottom_wall_poly)
    self.add_child(bottom_wall)


func spawn_rackets():
    var player_racket := Racket.instance()
    player_racket.initialize(Vector2(32, 384), Color(1, 0, 0))
    self.add_child(player_racket)

    var ai_racket := Racket.instance()
    ai_racket.initialize(Vector2(992, 384), Color(0, 1, 0))
    self.add_child(ai_racket)
