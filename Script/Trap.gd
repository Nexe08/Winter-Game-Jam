extends Node2D
# Trap

# warning-ignore:unused_signal
signal chunk_hase_been_deleted(node)

var chunk = preload("res://Scene/Chunk.tscn")
var spawn_point: int = 416

func _spawn_chunk(node) -> void:
    var instance = chunk.instance()
    add_child(instance)
    instance.position = Vector2(0, position.y - 416)
    node.queue_free()
