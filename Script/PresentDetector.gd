extends Area2D
# Present Detector


func _on_PresentDetector_area_entered(area: Area2D) -> void:
    if area.has_method("pick_up"):
        area.pick_up(get_parent())
