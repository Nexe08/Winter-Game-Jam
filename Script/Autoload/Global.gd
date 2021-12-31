extends Node2D
# Global

# warning-ignore:unused_signal
signal enemy_killed

var senta



func spawn_enemy(node: PackedScene, parent: Node) -> void:
    var instance = node.instance()
    parent.add_child(instance)
