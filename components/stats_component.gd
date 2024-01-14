class_name StatsComponent
extends Node


@export var health: int = 1:
	set(value):
		health = 1
		# Signal out that the health has changed
		health_changed.emit()

		if health == 0: no_health.emit()

signal health_changed()
signal no_health()