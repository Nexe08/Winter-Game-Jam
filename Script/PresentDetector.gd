extends Area2D
# Present Detector
export (NodePath) var inventory_path

onready var inventory = get_node(inventory_path)
onready var parent = get_parent() # senta


func _on_PresentDetector_area_entered(area: Area2D) -> void:
    if area.has_method("pick_up"):
        area.pick_up(self)
        inventory.add_gift_in_inventory(1)
