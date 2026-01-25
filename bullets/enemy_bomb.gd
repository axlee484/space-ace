extends BaseBullet

class_name EnemyBomb

@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite2D

var playerRef: Player


func _ready():
	playerRef = get_tree().get_first_node_in_group(GameManager.GROUP_PLAYER)
	_direction = (playerRef.global_position - global_position).normalized()
	var anims = animatedSprite.sprite_frames.get_animation_names()
	var animName = anims[randi_range(0, anims.size()-1)]
	animatedSprite.animation = animName
	animatedSprite.play()
