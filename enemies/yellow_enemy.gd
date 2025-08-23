extends Enemy

@export var horizontal_speed: int = 20

func _ready() -> void:
    super()
    move_component.velocity.x = [-horizontal_speed, horizontal_speed].pick_random()