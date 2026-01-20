extends Area2D

class_name Player

@export var MARGIN := 32.0
@export var SPEED := Vector2(100,100)


@onready var sprite: Sprite2D = $Sprite2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

var topLeft := Vector2.ZERO
var bottomRight := Vector2.ZERO



func _ready():
    var vp = get_viewport()
    topLeft = vp.get_visible_rect().position + Vector2(MARGIN, MARGIN)
    bottomRight = vp.get_visible_rect().end - Vector2(MARGIN, MARGIN)


func move(delta: float):
    var inputDir = getInput()

    if inputDir.x:
        animationPlayer.play("turn")
        if inputDir.x > 0:
            sprite.flip_h = true
        else:
            sprite.flip_h = false
    else:
        animationPlayer.play("fly")

    position+= SPEED*delta*inputDir
    position = Vector2(
        clampf(position.x, topLeft.x, bottomRight.x),
        clampf(position.y, topLeft.y, bottomRight.y)
        )



func _process(delta: float) -> void:
    move(delta)


func getInput():
    var movement = Vector2(
        Input.get_axis("left", "right"),
        Input.get_axis("up", "down")
    )
    return movement.normalized()

    
