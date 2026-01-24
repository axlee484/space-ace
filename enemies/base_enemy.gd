extends PathFollow2D

class_name BaseEnemy

@export var SPEED: float = 0.05


func _process(delta):
    progress_ratio += SPEED*delta
    

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()
	

