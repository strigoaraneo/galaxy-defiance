class_name ShakeComponent
extends Node


@export var actor: Node2D
@export var shake_amount := 2.0
@export var shake_duration := 0.4


var current_shake_amount := 0


func tween_shake():
	current_shake_amount = shake_amount

	var tween = create_tween()
	tween.tween_property(self, "current_shake_amount", 0.0, shake_duration)


func _physics_process(delta: float) -> void:
	actor.position = Vector2(randf_range(-current_shake_amount, current_shake_amount), \
							randf_range(-current_shake_amount, current_shake_amount))

