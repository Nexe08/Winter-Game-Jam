extends Node2D
# Game

export (int) var on_screen_gift_count = 10
export (int) var on_screen_enemy_count = 18

func _ready() -> void:
    Global.game = self
    randomize()
    _spawn_present()

func _spawn_present():
    var present_instance = Preloader.get_resource("Present").instance()
    add_child(present_instance)
