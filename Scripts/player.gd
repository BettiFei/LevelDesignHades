extends CharacterBody2D

@export var speed : int = 400
var move_direction : Vector2 = Vector2(0,0)

@onready var camera: Camera2D = $Camera2D


func _physics_process(_delta: float) -> void:
	move()
	teleport()
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	
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

func teleport() -> void:
	
	# Level Entrance: LevelEntrance:<Node2D#43201332615>
	# Temple District: TempleDistrict:<Node2D#43956307335>
	# Boss Arena: FinalBossArena:<Node2D#43352327559>
	# Level Exit: LevelExit:<Node2D#43234887047>
	
	var active_scene = str(get_tree().current_scene)
	
	if Input.is_action_pressed("one"):
		if active_scene != "LevelEntrance:<Node2D#43201332615>":
			get_tree().change_scene_to_file("res://Scenes/level_entrance.tscn")
			#print("Can teleport.")
		else:
			get_tree().reload_current_scene()
			#print("Already there.")
	
	if Input.is_action_pressed("two"):
		if active_scene != "TempleDistrict:<Node2D#43956307335>":
			get_tree().change_scene_to_file("res://Scenes/temple_district.tscn")
		else:
			get_tree().reload_current_scene()
	
	if Input.is_action_pressed("three"):
		if active_scene != "FinalBossArena:<Node2D#43352327559>":
			get_tree().change_scene_to_file("res://Scenes/final_boss_arena.tscn")
		else:
			get_tree().reload_current_scene()
	
	if Input.is_action_pressed("four"):
		if active_scene != "LevelExit:<Node2D#43234887047>":
			get_tree().change_scene_to_file("res://Scenes/level_exit.tscn")
		else:
			get_tree().reload_current_scene()
