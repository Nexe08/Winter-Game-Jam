extends Area2D
# Bomb

var damage: float = 5.0

func _on_Bomb_body_entered(body: Node) -> void:
    if body.has_method("take_damage"):
        body.take_damage(damage)
