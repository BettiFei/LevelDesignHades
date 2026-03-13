# Camera2D.gd
extends Camera2D

@export var move_speed: float = 2.0        # shift speed
@export var lock_position: Vector2 = Vector2.ZERO

var locked: bool = false
var default_target: Node2D

func _ready():
	default_target = get_parent()

func _process(delta):
	var target_pos = default_target.global_position
	if locked:
		target_pos = lock_position
	
	# smooth transition to target position:
	global_position = global_position.lerp(target_pos, move_speed * delta)

func lock_camera(lock: bool):
	locked = lock
