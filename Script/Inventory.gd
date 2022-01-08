extends Node2D
# Inventory

onready var gift_count: int = 0
onready var can_pick:= true

const MAX_GIFT_COUNT = 1

func _ready() -> void:
    Global.emit_signal("gift_count_updated", gift_count)

func _process(delta: float) -> void:
    can_pick = false if gift_count >= MAX_GIFT_COUNT else true

func add_gift_in_inventory(value: int) -> void:
    if gift_count <= MAX_GIFT_COUNT:
        gift_count += value
        Global.emit_signal("gift_count_updated", gift_count)
