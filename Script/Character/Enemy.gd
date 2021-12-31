extends KinematicBody2D
# Enemy

var explosition_damage: float = 2
var movement_speed: float = 40
var velocity:= Vector2()
const UP:= Vector2.UP

onready var can_attack: bool = false
onready var senta: Node
onready var sprite = $Sprite

func _ready() -> void:
    _choose_rendom_position()

func _physics_process(delta: float) -> void:
    _move_towords_senta(delta)
    _handel_attack_state()
    _handdel_sprite_oriantation()
    velocity = move_and_slide(velocity, UP)

func _choose_rendom_position() -> void:
    var ss = get_viewport_rect().size
    # 16 is tile size
    var choosen_position = Vector2(rand_range(16, (ss.x - 16)), rand_range(16, (ss.y - 16)))
    global_position = choosen_position

func _handel_attack_state() -> void:
    if can_attack == false:
        return
    
    $AnimationPlayer.play("AttackState")

func _handdel_sprite_oriantation() -> void:
    var direction = velocity.normalized()
    sprite.flip_h = true if direction.x < 0 else false

func _move_towords_senta(delta: float) -> void:
    if senta == null:
        velocity = lerp(velocity, Vector2.ZERO, (5 * delta))
    else:
        var direction = global_position.direction_to(senta.global_position)
        var distance = global_position.distance_to(senta.global_position)
        if distance > 26 and not can_attack:
            velocity = lerp(velocity, movement_speed * direction, (5 * delta))
            can_attack = false
        else:
            velocity = lerp(velocity, Vector2.ZERO, (5 * delta))
            can_attack = true

func _self_distruction() -> void:
    Global.emit_signal("enemy_killed")
    queue_free()

func _on_SentaDetector_body_entered(body: Node) -> void:
    senta = body

func _on_SentaDetector_body_exited(_body: Node) -> void:
    senta = null

func _on_ExplositionArea_body_entered(body: Node) -> void:
    if body.has_method("take_damage"):
        body.take_damage(explosition_damage)
    pass # Replace with function body.
