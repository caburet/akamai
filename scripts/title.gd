extends Sprite


func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		get_tree().change_scene("res://scenes/World.tscn")
	pass
