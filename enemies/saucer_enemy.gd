extends BaseEnemy


var isAnimationPlayed := false
var animName: String

func _ready():
    var anims := animatedSprite.sprite_frames.get_animation_names()
    animName = anims[randi_range(0, anims.size()-1)]
    animatedSprite.animation = animName


func playAnimation():
    animatedSprite.play()
    isAnimationPlayed = true



func shoot():
    if isAnimationPlayed:
        enemyGun.shoot(Vector2.DOWN)


func _process(delta):
    progress_ratio += SPEED*delta
    if progress_ratio >= 0.3 and not isAnimationPlayed:
        playAnimation()
    shoot()

