extends Node2D

var margin: int = 9
var screen_width: int = ProjectSettings.get_setting("display/window/size/viewport_width")

@export var green_enemy_scene: PackedScene
@export var yellow_enemy_scene: PackedScene

@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var green_enemy_spawn_timer: Timer = $GreenEnemySpawnTimer
@onready var yellow_enemy_spawn_timer: Timer = $YellowEnemySpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	green_enemy_spawn_timer.connect('timeout', handle_spawn.bind(green_enemy_scene, green_enemy_spawn_timer))
	yellow_enemy_spawn_timer.connect('timeout', handle_spawn.bind(yellow_enemy_scene, yellow_enemy_spawn_timer))


func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawner_component.spawn_scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width - margin), -16))
	timer.start()


