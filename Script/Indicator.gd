extends Node2D
# Indicator


func _process(delta: float) -> void:
    if is_instance_valid(Global.child):
        look_at(Global.child.global_position)
