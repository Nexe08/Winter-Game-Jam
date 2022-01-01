extends Node2D
# Inventory

onready var gift_count: int = 0

func _ready() -> void:
    Global.emit_signal("gift_count_updated", gift_count)

func add_gift_in_inventory(value: int) -> void:
    gift_count += value
    Global.emit_signal("gift_count_updated", gift_count)
