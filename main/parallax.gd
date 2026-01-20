extends Parallax2D

@export var scroll_speed := Vector2(100.0, 100.0)

func _process(delta):
	scroll_offset += scroll_speed * delta