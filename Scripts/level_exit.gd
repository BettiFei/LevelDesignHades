extends Node2D

@onready var light_effect_area: Area2D = $Area2D
@onready var world_light: DirectionalLight2D = $WorldLight
@onready var flash_rect: ColorRect = $CanvasLayer/Control/FlashRect


var flash_tween: Tween


func _ready() -> void:
	flash_rect.color = Color(1.0, 0.96, 0.8, 0.0)
	

func _on_light_effect_area_body_entered(body: Node2D) -> void:
	if !body.is_in_group("player"):
		return
	
	print("Player entered area.")
	
	if flash_tween:
		flash_tween.kill()
	
	world_light.blend_mode = 0 #add
	
	flash_tween = get_tree().create_tween()
	
	# SCREEN FLASH
	flash_tween.tween_property(flash_rect, "color", Color(1.0, 0.96, 0.8, 1.0), 0.05)
	flash_tween.tween_interval(0.05)
	flash_tween.tween_property(flash_rect, "color", Color(1.0, 0.96, 0.8, 0.0), 3.0)


func _on_light_effect_area_body_exited(body: Node2D) -> void:
	if !body.is_in_group("player"):
		return
	
	print("Player exited area.")
	
	if body.global_position.y >= -1300:
		world_light.blend_mode = 1 #subtract
