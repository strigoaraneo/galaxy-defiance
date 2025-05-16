class_name DestroyComponent
extends Node

# The actor this component will operate on
@export var actor: Node2D

# Get stats for the no_health signal
@export var stats_component: StatsComponent

# Spawn death effect
@export var destroy_effect_spawner_component: SpawnerComponent


func _ready() -> void:
	stats_component.no_health.connect(destroy)

func destroy() -> void:
	destroy_effect_spawner_component.spawn(actor.global_position)
	actor.queue_free()