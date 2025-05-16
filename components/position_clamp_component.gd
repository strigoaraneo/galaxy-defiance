class_name PositionClampComponent
extends Node


@export var actor: Node2D
@export var margin: int = 8


var left_border: int = 0
var right_border: int = ProjectSettings.get_setting("display/window/size/viewport_width")
var top_border: int = 0
var bottom_border: int = ProjectSettings.get_setting("display/window/size/viewport_height")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	actor.global_position.x = clamp(actor.global_position.x, left_border + margin, right_border - margin)
	actor.global_position.y = clamp(actor.global_position.y, top_border + margin, bottom_border - margin)
