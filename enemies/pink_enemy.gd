class_name PinkEnemy
extends Enemy

@onready var states: Node = $States
@onready var move_down_state: TimedStateComponent = %MoveDownState
@onready var move_side_state: TimedStateComponent = %MoveSideState
@onready var pause_state: TimedStateComponent = %PauseState
@onready var move_side_component: MoveComponent = %MoveSideComponent


func _ready() -> void:
    super()

    for state: StateComponent in states.get_children():
        state.disable()
    
    move_side_component.velocity.x = move_side_component.velocity.x * (-1 if randf() > 0.5 else 1)

    move_down_state.state_finished.connect(move_side_state.enable)
    move_side_state.state_finished.connect(pause_state.enable)
    pause_state.state_finished.connect(move_down_state.enable)

    move_down_state.enable()