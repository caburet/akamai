extends Area2D
onready var mensaje = get_node( "burbuja" )
var nombre= '1'

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	mensaje.set_visible(false)
	for body in bodies:
#		print (bodies)
		if body.name =="player":
#			print(body.name+" quiere hablar con vos "+ nombre)
			mensaje.set_visible(true)
			if Input.is_action_just_pressed("ui_up"):
				print("estas interctuando con "+ nombre)
#				print(logica.npc_talk(int(nombre)).textos)
				texto = logica.npc_talk(int(nombre)).textos
				for texto:
					
#				mensaje.set_visible(false)
				get_node("../player").set_interactuando(true) 
		pass


