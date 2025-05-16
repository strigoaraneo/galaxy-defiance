class_name OnetimeAnimatedEffect

extends AnimatedSprite2D


func _ready() -> void:
	# Free this node once the animation is finished.
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)