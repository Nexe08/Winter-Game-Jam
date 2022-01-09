extends Label
# Timer

var time = 120

func _process(delta: float) -> void:
    time -= delta
    text = String(int(time))
