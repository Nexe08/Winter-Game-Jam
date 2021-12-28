extends Area2D
# Propes

var texture_choice = [
    "res://Assate/Sprites/Props/Original/Gifts/gift_blue.png",
    "res://Assate/Sprites/Props/Original/Gifts/gift_green.png",
    "res://Assate/Sprites/Props/Original/Gifts/gift_red.png"
   ]

func _ready() -> void:
    _choose_random_position()
    texture_choice.shuffle()
    $Sprite.texture = load(texture_choice.front())

func _choose_random_position():
    var ss = get_viewport_rect().size
    # 16 is tile size
    var choosen_position = Vector2(rand_range(16, (ss.x - 16)), rand_range(16, (ss.y - 16)))
    global_position = choosen_position

func pick_up(node):
    # disapear animation
    # change needed variable
    # choose random position
    # apear animation
    pass
