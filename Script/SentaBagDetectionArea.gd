extends Area2D
# Senta Bag Detection Area

export (NodePath) var sprite_path

var gift_in_bag: int = 0

onready var sprite = get_node(sprite_path)

func _process(delta: float) -> void:
    sprite.scale = lerp(sprite.scale, Vector2(.5, .5), 5 * delta)

func deposite():
    sprite.scale = Vector2(.8, .8)
    gift_in_bag += 1
