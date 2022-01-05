extends Node2D
# Global

# warning-ignore:unused_signal
signal bomb_count_updated(value)
# warning-ignore:unused_signal
signal enemy_killed
# warning-ignore:unused_signal
signal game_over
# warning-ignore:unused_signal
signal gift_count_updated(value)
# warning-ignore:unused_signal
signal senta_health_updated(value)
# warning-ignore:unused_signal
signal start_game
# warning-ignore:unused_signal
signal quit_game
# warning-ignore:unused_signal
signal restart_game
# warning-ignore:unused_signal
signal update_bomb_count(value)

var camera
var game
var game_over_screen
var senta

func spawn_enemy(node: PackedScene, parent: Node) -> void:
    var instance = node.instance()
    parent.add_child(instance)
