extends Node2D

class_name BaseGun

@export var BULLET: GameManager.BULLET_TYPE
@export var SPEED: float = 1.0
@export var FIRE_RATE: float = 1.0
@export var DAMAGE: float = 1.0


@onready var cooldownTimer: Timer = $CooldownTimer

var canShoot = false

func _ready():
    cooldownTimer.wait_time = FIRE_RATE
    canShoot = true
    cooldownTimer.start()

func shoot(direction: Vector2):
    if canShoot:
        ObjectMaker.createBullet(BULLET, global_position, direction, SPEED, DAMAGE)
        canShoot = false



func _on_cooldown_timer_timeout() -> void:
    canShoot = true
