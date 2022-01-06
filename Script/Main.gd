extends Node2D
# Main

func _ready() -> void:
    # warning-ignore:return_value_discarded
    Global.connect("start_game", self, "_start_transition_animation")

func _start_transition_animation():
    $TopLayer/AnimationPlayer.play("start_transition")

# called in animation player
func _start_game():
    var game_instance = Preloader.get_resource("Game").instance()
    add_child(game_instance)
    
    $CanvasLayer/MainMenu.queue_free()
