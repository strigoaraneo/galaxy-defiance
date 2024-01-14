extends Node2D


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	scale_component.tween_scale()
	flash_component.flash()

	# Unbind 1 argument passed to queue_free by the hit_hurtbox signal
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))