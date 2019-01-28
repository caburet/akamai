extends Area2D



func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		print (bodies)
		if body.name =="player":
			print(body.name+" Al fin lo lograste conociste a mucha gente hoy!!!! ")