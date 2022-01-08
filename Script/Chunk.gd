extends Node2D
# Chunk

var speed: float = 60

func _ready() -> void:
    randomize()
    _make_path_between_danger_things()

func _process(delta: float) -> void:
    position.y += speed * delta
    
    if global_position.y > 208:
        get_parent().emit_signal("chunk_hase_been_deleted", self)

func _make_path_between_danger_things():
    var removable_thing = get_children()
    var index = randi() % removable_thing.size()
    removable_thing[index].queue_free()
    
    if index > 0:
        removable_thing[index - 1].queue_free()
    else:
        removable_thing[index + 2].queue_free()
    
    if index < removable_thing.size() - 1:
        removable_thing[index + 1].queue_free()
    else:
        removable_thing[index - 2].queue_free()

