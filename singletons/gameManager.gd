extends Node


enum BULLET_TYPE {
    PLAYER_BULLET,
    ENEMY_BULLET,
    ENEMY_MISSILE,
    ENEMY_BOMB
}

var GROUP_PLAYER = "player"

var ZIPPER_ENEMY = "zipper_enemy"
var BOMBER_ENEMY = "bomber_enemy"
var BIOMECH_ENEMY = "biomech_enemy"
var SAUCER_ENEMY = "saucer_enemy"


var ENEMIES = {
    ZIPPER_ENEMY : {
        "horde_size": 4,
        "spawn_time": 1
    },
    BOMBER_ENEMY : {
        "horde_size": 2,
        "spawn_time": 2
    },
    BIOMECH_ENEMY : {
        "horde_size": 4,
        "spawn_time": 1
    },
    SAUCER_ENEMY : {
        "horde_size": 1,
        "spawn_time": 1.5
    },
}