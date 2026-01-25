extends Node2D


@export var HORDE_WAIT_TIME = 15
@export var HORDE_COUNT = 4

@onready var pathNode = $Paths
@onready var waveTime: Timer = $WaveTimer
var paths: Array[Path2D]
var lastPath: Path2D

func _ready():
	for path in pathNode.get_children():
		if path is Path2D:
			paths.push_back(path)
	spawnEnemies()

func pickRandomEnemyType():
	var type :String = GameManager.ENEMIES.keys().pick_random()
	return type


func pickRandomPath():
	var path := lastPath
	if not lastPath:
		path = paths.pick_random()
	
	else:
		while(path.name == lastPath.name):
			path = paths.pick_random()
	
	lastPath = path
	return path
	


func spawnEnemy():
	var enemyType: String = pickRandomEnemyType()
	var hordeSize = GameManager.ENEMIES[enemyType]["horde_size"]
	
	for i in range(0, hordeSize):
		var newEnemy = ObjectMaker.createEnemy(enemyType)
		var path = pickRandomPath()
		path.add_child(newEnemy)
		await get_tree().create_timer(GameManager.ENEMIES[enemyType]["spawn_time"]).timeout



func spawnEnemies():
	for i in range(0, HORDE_COUNT):
		spawnEnemy()
		await get_tree().create_timer(HORDE_WAIT_TIME).timeout

	


func _on_timer_timeout() -> void:
	spawnEnemies()
	
