class_name StateComponent
extends Node


signal enabled()
signal disabled()
signal state_finished()


func disable() -> void:
    disabled.emit()
    process_mode = Node.PROCESS_MODE_DISABLED


func enable() -> void:
    enabled.emit()
    # Use 'inherit' mode so that this node will pause if the game is paused or it's parent is disabled.
    process_mode = Node.PROCESS_MODE_INHERIT
