extends Control
#HUD

func _ready() -> void:
    Global.connect("senta_health_updated", self, "_handel_senta_health_visual")

func _handel_senta_health_visual(value) -> void:
    $MC/SentaHealthBar/Label.text = String(value)
