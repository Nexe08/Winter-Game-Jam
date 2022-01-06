extends Control
# Main Menu

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_released("space"):
        Global.emit_signal("start_game")
