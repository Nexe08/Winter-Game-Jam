extends Node2D
# Global

# warning-ignore:unused_signal
signal bomb_count_updated(value)
# warning-ignore:unused_signal
signal enemy_killed
# warning-ignore:unused_signal
signal gift_count_updated(value)
# warning-ignore:unused_signal
signal senta_health_updated(value)
# warning-ignore:unused_signal
signal start_game

var camera
var senta

func spawn_enemy(node: PackedScene, parent: Node) -> void:
    var instance = node.instance()
    parent.add_child(instance)
