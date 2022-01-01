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
    _handel_sprite_property()

func _choose_random_position():
    _handel_sprite_property()
    var ss = get_viewport_rect().size
    # 16 is tile size
    var choosen_position = Vector2(rand_range(16, (ss.x - 16)), rand_range(16, (ss.y - 16)))
    global_position = choosen_position

func _handel_sprite_property():
    $Sprite.texture = load(texture_choice.front())
    $Sprite.visible = true

func pick_up(node):
    if node.has_method("_gift_picked_up"):
        node._gift_picked_up(1)
    
    $AnimationPlayer.play("picked_up")
#    _choose_random_position()
    # apear animation
