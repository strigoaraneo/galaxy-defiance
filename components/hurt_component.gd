class_name HurtComponent
extends Node


@export var stats_component: StatsComponent
@export var hurtbox_component: HurtboxComponent


func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		stats_component.health -= hitbox.damage
	)
