extends Node

@onready var explosionScene: PackedScene = preload("res://explosion/explosion.tscn")


var BULLETS: Dictionary[GameManager.BULLET_TYPE, PackedScene] = {
	GameManager.BULLET_TYPE.PLAYER_BULLET : preload("res://bullets/player_bullet.tscn"),
	GameManager.BULLET_TYPE.ENEMY_BULLET : preload("res://bullets/enemy_bullet.tscn"),
	GameManager.BULLET_TYPE.ENEMY_MISSILE: preload("res://bullets/homing_missile.tscn"),
	GameManager.BULLET_TYPE.ENEMY_BOMB: preload("res://bullets/enemy_bomb.tscn")
}

var ENEMIES: Dictionary[String, PackedScene] = {
	GameManager.ZIPPER_ENEMY : preload("res://enemies/zipper_enemy.tscn"),
	GameManager.BOMBER_ENEMY: preload("res://enemies/bomber_enemy.tscn"),
	GameManager.BIOMECH_ENEMY: preload("res://enemies/biomech_enemy.tscn"),
	GameManager.SAUCER_ENEMY: preload("res://enemies/saucer_enemy.tscn")
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
	var bulletLayer = get_tree().root.get_node_or_null("Level/BulletLayer")
	addNodeToTree(bullet, bulletLayer)


func createEnemy(enemyType: String) -> PathFollow2D:
	var enemy: BaseEnemy = ENEMIES[enemyType].instantiate()
	return enemy
