extends Control
#HUD

func _ready() -> void:
# warning-ignore:return_value_discarded
    Global.connect("senta_health_updated", self, "_handel_senta_health_visual")
# warning-ignore:return_value_discarded
    Global.connect("gift_count_updated", self, "_handel_gift_count_visual")

func _handel_gift_count_visual(value) -> void:
    $MC/HBoxContainer/GiftCount/Label.text = String(value)

func _handel_senta_health_visual(value) -> void:
    $MC/HBoxContainer/SentaHealthBar/Label.text = String(value)
