extends Node2D


@onready var pathNode = $Paths
var paths: Array[Path2D]

func _ready():
    for path in pathNode.get_children():
        if path is Path2D:
            paths.push_back(path)
    
    spawnEnemy()


func spawnEnemy():
    for path in paths:
        var enemy := ObjectMaker.createEnemy(GameManager.ENEMY_TYPE.ZIPPER_ENEMY)
        path.add_child(enemy)