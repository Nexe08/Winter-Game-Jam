extends Control
# Game over scene

func _ready() -> void:
    $HBoxContainer/VBoxContainer/Text/HBoxContainer/FinalScore.text = String(Global.get_final_score())
    Global.game_over_screen = self

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_released("q"):
        Global.emit_signal("quit_game")
    
    if event.is_action_released("r"):
        Global.emit_signal("restart_game")
