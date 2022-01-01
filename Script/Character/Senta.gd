extends KinematicBody2D
# Senta


export (float) var movement_speed = 40
export (float) var Life = 5

var direction: Vector2
var velocity: Vector2
const UP = Vector2.UP

onready var fsm = $AnimationTree.get('parameters/playback')
onready var sprite = $Sprite

func _ready() -> void:
    Global.senta = self
    Global.emit_signal("senta_health_updated", Life)

func _physics_process(delta: float) -> void:
    Global.camera.follow_target(self, 2.5, Vector2(0, 1024), Vector2(0, 600))
    _handel_movement(delta)
    _handel_animation()
    velocity = move_and_slide(velocity, UP)

func _handel_movement(delta):
    direction.x = int(Input.get_action_strength("d") - Input.get_action_strength("a"))
    direction.y = int(Input.get_action_strength("s") - Input.get_action_strength("w"))
    
    velocity.x = lerp(velocity.x, movement_speed * direction.x, 5 * delta)
    velocity.y = lerp(velocity.y, movement_speed * direction.y, 5 * delta)

func _handel_animation():
    
    if direction.x == 0 and direction.y == 0:
        fsm.travel("idle")
    else:
        fsm.travel("walk")
        
        if velocity.x < 0:
            sprite.flip_h = true
        else:
            sprite.flip_h = false

func take_damage(takken_damage: float) -> void:
    if Life <= 0:
        return
    
    Life -= takken_damage
    Global.emit_signal("senta_health_updated", Life)
