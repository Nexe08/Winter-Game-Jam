extends Label
# Timer

var time = 120

func _process(delta: float) -> void:
    time -= delta
    text = String(int(time))
    
    if time <= 0:
        Global.emit_signal("game_over")
        queue_free()
