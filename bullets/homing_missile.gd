extends BaseBullet

class_name HomingMissile

var playerRef: Player
var isChasing := true

func _ready():
	playerRef = get_tree().get_first_node_in_group(GameManager.GROUP_PLAYER)
	_direction = (playerRef.global_position - global_position).normalized()


func _process(delta):
	global_position += (_speed*_direction)*delta
	if isChasing:
		_direction = (playerRef.global_position - global_position).normalized()
		rotation =_direction.angle()
		


func _on_timer_timeout() -> void:
	isChasing = false
