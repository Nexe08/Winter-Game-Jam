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
    # right side of the screen
    var choosen_position = Vector2(rand_range(ss.x -20,ss.x - 12), rand_range(12, ss.y - 12))
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
