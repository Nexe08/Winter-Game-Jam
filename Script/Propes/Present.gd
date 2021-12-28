extends Area2D
# Propes

var texture_choice = [
    "res://Assate/Sprites/Props/Original/Gifts/gift_blue.png",
    "res://Assate/Sprites/Props/Original/Gifts/gift_green.png",
    "res://Assate/Sprites/Props/Original/Gifts/gift_red.png"
   ]

func _ready() -> void:
    texture_choice.shuffle()
    $Sprite.texture = load(texture_choice.front())

func pick_up():
    pass
