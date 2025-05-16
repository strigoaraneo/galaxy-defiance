class_name SpawnerComponent
extends Node2D


@export var spawn_scene: PackedScene


func spawn(global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node2D:
	assert(spawn_scene is PackedScene, "Error: spawn_scene export variable is not set.")

	var instance = spawn_scene.instantiate()
	parent.add_child(instance)
	instance.global_position = global_spawn_position

	return instance
