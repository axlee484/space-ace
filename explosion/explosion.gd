extends Node2D


class_name Explosion

@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite2D




func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
