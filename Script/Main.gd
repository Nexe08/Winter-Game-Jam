extends Node2D
# Main
onready var anim = $TopLayer/AnimationPlayer

func _ready() -> void:
    $TopLayer/ColorRect.color = Color(255, 255, 255, 0)
    # warning-ignore:return_value_discarded
    Global.connect("start_game", self, "_start_transition_animation")
    # warning-ignore:return_value_discarded
    Global.connect("restart_game", self, "_restart_game_animation")
    # warning-ignore:return_value_discarded
    Global.connect("quit_game", self, "_quit_game_animation")
    # warning-ignore:return_value_discarded
    Global.connect("game_over", self, "_game_over_screen")

#############################################
#           SIGNAL CONNECTION
#############################################
func _start_transition_animation():
    anim.play("start_transition")

func _game_over_screen():
    anim.play("game_over_animation")

func _restart_game_animation():
    anim.play("restart_game_animation")

func _quit_game_animation():
    anim.play("quit_game_animation")

#################################################
#           CALLED IN ANIMATION
#################################################
func _start_game():
    var game_instance = Preloader.get_resource("Game").instance()
    add_child(game_instance)
    
    $CanvasLayer/MainMenu.queue_free()

func _game_over():
    var game_over_screen_instance = Preloader.get_resource("GameOverScreen").instance()
    $TopLayer.add_child(game_over_screen_instance)
    
    if is_instance_valid(Global.game):
        Global.game.queue_free()

func _restart_game():
    var game_instance = Preloader.get_resource("Game").instance()
    add_child(game_instance)
    
    if is_instance_valid(Global.game_over_screen):
        Global.game_over_screen.queue_free()

func _quit_game():
    get_tree().quit()
