extends Node

@onready var explosionScene: PackedScene = preload("res://explosion/explosion.tscn")


var BULLETS: Dictionary[GameManager.BULLET_TYPE, PackedScene] = {
	GameManager.BULLET_TYPE.PLAYER_BULLET : preload("res://bullets/player_bullet.tscn"),
	GameManager.BULLET_TYPE.ENEMY_BULLET : preload("res://bullets/player_bullet.tscn")
}

var ENEMIES: Dictionary[GameManager.ENEMY_TYPE, PackedScene] = {
	GameManager.ENEMY_TYPE.ZIPPER_ENEMY : preload("res://enemies/zipper_enemy.tscn"),
}




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


func createBullet(bulletType: GameManager.BULLET_TYPE, global_position: Vector2, direction: Vector2, speed: float, damage: float):
	var bullet: BaseBullet = BULLETS[bulletType].instantiate()
	bullet.setup(direction, global_position, speed, damage)
	addNodeToTree(bullet)


func createEnemy(enemyType: GameManager.ENEMY_TYPE) -> PathFollow2D:
	var enemy: BaseEnemy = ENEMIES[enemyType].instantiate()
	return enemy
