extends Node

@onready var explosionScene: PackedScene = preload("res://explosion/explosion.tscn")



func _addNodeToTree(node: Node2D, parent: Node2D = null):
    if parent:
        parent.add_child(node)
        return
    get_tree().root.add_child(node)

func addNodeToTree(node: Node2D, parent: Node2D = null):
    call_deferred("_addNodeToTree", node, parent)



func createExplosion(position: Vector2, parent: Node2D = null):
    var explosion: Explosion = explosionScene.instantiate()
    explosion.position = position
    addNodeToTree(explosion, parent)

    