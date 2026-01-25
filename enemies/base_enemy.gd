extends PathFollow2D

class_name BaseEnemy

@export var SPEED: float = 0.05
@export var DAMAGE: float = 1.0
@export var IS_SHOOTING := false

@onready var enemyGun: BaseGun = $EnemyGun
@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite2D


var isVisible := false



func _ready():
    var anims := animatedSprite.sprite_frames.get_animation_names()
    animatedSprite.play(anims[randi_range(0, anims.size()-1)])

func _process(delta):
    progress_ratio += SPEED*delta
    if IS_SHOOTING and isVisible:
        shoot()
    

func shoot():
    enemyGun.shoot(Vector2.DOWN)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()
    


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
    isVisible = true
