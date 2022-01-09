extends Label
# Timer

var time = 60

func _process(delta: float) -> void:
    time -= delta
    text = String(int(time))
