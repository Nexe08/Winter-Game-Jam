extends Area2D
# Child

func _ready() -> void:
    _choose_random_position()

func _choose_random_position():
    var ss = get_viewport_rect().size
    # 16 is tile size
    var choosen_position = Vector2(rand_range(16, (ss.x - 16)), rand_range(16, (ss.y - 16)))
    global_position = choosen_position

func take_gift():
    _choose_random_position()
    # reset data if nedded
    # choose random position
    pass
