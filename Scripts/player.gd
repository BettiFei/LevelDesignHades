extends CharacterBody2D

@export var speed : int = 400
var move_direction : Vector2 = Vector2(0,0)

func _physics_process(_delta: float) -> void:
	move()
	
func move() -> void:
	move_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	move_direction.y = int(Input.is_action_pressed("move_down"))- int(Input.is_action_pressed("move_up")) / float(2)
	var motion : Vector2 = move_direction.normalized() * speed
	set_velocity(motion)
	move_and_slide()
