extends Area2D

var day=1

func _physics_process(delta):
	var viendoFamilia= false
	var bodies = get_overlapping_bodies()
	for body in bodies:
#		print (bodies)
		if body.name =="player" and Input.is_action_just_pressed("ui_up"):
#			print(body.name+" Al fin lo lograste conociste a mucha gente hoy!!!! ")
			print("revisando familia")
			$"../AnimationPlayer".play("New Anim")
			
#			for i in range(0, 255, 1):
#				get_node("../Timer").start()
#				print(i)
#				get_node("../player/fade").modulate.a=i


func _on_AnimationPlayer_animation_finished(anim_name):
	get_node("../player").position= get_node ("../Inicio").position
	$"../AnimationPlayer".stop(true)
	$"../CanvasModulate".set_color("#f4e5e5")
	day+=1
	print (day)
	$"../CanvasLayer/DayLabel".text="Day "+str(day)
	pass # Replace with function body.
