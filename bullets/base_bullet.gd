extends Node2D

class_name BaseBullet

var _direction: Vector2 = Vector2.ZERO
var _speed: float = 0
var _damage: float = 0



func setup(direction: Vector2, global_position_: Vector2, speed: float, damage: float):
    global_position = global_position_
    _direction = direction
    _speed = speed
    _damage = damage

func _process(delta):
    global_position += (_speed*_direction)*delta

    


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()