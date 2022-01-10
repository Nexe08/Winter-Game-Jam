extends Control
# Main Menu

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_released("space"):
        Global.emit_signal("start_game")


func _on_LinkButton_pressed() -> void:
    OS.shell_open("https://pixabay.com/music/christmas-jingle-bells-11295/")

func _on_LinkButton2_pressed() -> void:
    OS.shell_open("https://twitter.com/nexe0044")
