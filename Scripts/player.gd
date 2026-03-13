extends CharacterBody2D

@export var speed : int = 400
var move_direction : Vector2 = Vector2(0,0)

@onready var camera: Camera2D = $Camera2D


func _physics_process(_delta: float) -> void:
	move()
	
func move() -> void:
	move_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	move_direction.y = int(Input.is_action_pressed("move_down"))- int(Input.is_action_pressed("move_up")) / float(2)
	var motion : Vector2 = move_direction.normalized() * speed
	set_velocity(motion)
	move_and_slide()

func lock_camera(lock: bool, lock_position: Vector2 = Vector2.ZERO):
	if lock:
		camera.lock_position = lock_position
		camera.lock_camera(true)
	else:
		camera.lock_camera(false)
