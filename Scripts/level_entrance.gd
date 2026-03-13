extends Node2D


func _on_exit_level_area_body_entered(body: Node2D) -> void:
	if !body.is_in_group("player"):
		return
	
	call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file("res://Scenes/temple_district.tscn")
	
