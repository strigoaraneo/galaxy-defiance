extends ParallaxBackground


@onready var space_layer: ParallaxLayer = %SpaceLayer
@onready var far_stars_layer: ParallaxLayer = %FarStarsLayer
@onready var close_stars_layer: ParallaxLayer= %CloseStarsLayer

@export var player_ship: Node2D

var ship_move_component: MoveComponent
var ship_position_clamp_component: PositionClampComponent


func _ready() -> void:
	if player_ship:
		ship_move_component = player_ship.find_child("MoveComponent")
		ship_position_clamp_component = player_ship.find_child("PositionClampComponent")


func _process(delta: float) -> void:
	space_layer.motion_offset.y += 5 * delta
	close_stars_layer.motion_offset.y += 10 * delta
	far_stars_layer.motion_offset.y += 20 * delta

	if player_ship:
		if ship_move_component.velocity.x < 0:
			if player_ship.position.x > ship_position_clamp_component.left_border + ship_position_clamp_component.margin: 
				space_layer.motion_offset.x += 2 * delta
				close_stars_layer.motion_offset.x += 5 * delta
				far_stars_layer.motion_offset.x += 10 * delta
		elif ship_move_component.velocity.x > 0:
			if player_ship.position.x < ship_position_clamp_component.right_border - ship_position_clamp_component.margin:
				space_layer.motion_offset.x -= 2 * delta
				close_stars_layer.motion_offset.x -= 5 * delta
				far_stars_layer.motion_offset.x -= 10 * delta
