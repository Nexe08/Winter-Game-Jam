extends Area2D
# Present Detector

onready var parent = get_parent() # senta


func _on_PresentDetector_area_entered(area: Area2D) -> void:
    if area.has_method("pick_up"):
        area.pick_up(self)

func _gift_picked_up(value: int = 1):
    parent.set_gift_count(value)
