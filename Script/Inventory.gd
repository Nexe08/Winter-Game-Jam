extends Node2D
# Inventory

onready var gift_count: int = 0
onready var bomb_count: int = 3 setget ,get_bomb_count

const MAX_BOMB_COUNT: int = 3

func _ready() -> void:
    # warning-ignore:return_value_discarded
    Global.connect("update_bomb_count", self, "update_bomb_count")
    Global.emit_signal("gift_count_updated", gift_count)
    Global.emit_signal("bomb_count_updated", bomb_count)

func add_gift_in_inventory(value: int) -> void:
    gift_count += value
    Global.emit_signal("gift_count_updated", gift_count)

func get_bomb_count() -> int:
    Global.emit_signal("bomb_count_updated", bomb_count)
    return bomb_count

func update_bomb_count(value: int) -> void:
    bomb_count += value
    Global.emit_signal("bomb_count_updated", bomb_count)
