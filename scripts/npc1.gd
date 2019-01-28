extends Area2D
onready var mensaje = get_node( "burbuja" )
var nombre= '1'
var logicadic
var textoslen
var textos 
var opcion1 
var opcion2 
var count =0
var end =0
var last_press = 0
var nomore = false
func _physics_process(delta):

	if get_node("../player").interactuando == true or nomore:
		$burbuja.visible=false
	else:
		$burbuja.visible=true
	if Input.is_action_pressed("ui_right"):
		last_press = 0
		print (get_node("../player").interactuando)
	if Input.is_action_pressed("ui_left"):
		last_press =1	
	if last_press == 0:
		get_node("../player/Opcion1").add_color_override("font_color", Color(0,0,0))
		get_node("../player/Opcion2").add_color_override("font_color", Color(0,0,1))
	if last_press==1:
		get_node("../player/Opcion1").add_color_override("font_color", Color(0,0,1))
		get_node("../player/Opcion2").add_color_override("font_color", Color(0,0,0))
	
	var bodies = get_overlapping_bodies()
	mensaje.set_visible(false)
	
	for body in bodies:
#		print (bodies)
		if body.name =="player":
#			print(body.name+" quiere hablar con vos "+ nombre)
			
			if get_node("../player").interactuando == false:
				mensaje.set_visible(true)
		#	print(body.name+" quiere hablar con vos "+ nombre)
			if nomore:
				mensaje.set_visible(false)
				get_node("../player").set_interactuando(false) 
			if Input.is_action_just_pressed("ui_up") and get_node("../player").interactuando == false:
				logicadic = logica.npc_talk(int(nombre))
				print (logicadic)
				if logicadic:
					get_node("../player").interactuando = true
					print (logicadic)
					print (get_node("../player").interactuando)
					textos = logicadic.textos
					textoslen = len(logicadic.textos)
					print (textos)
					opcion1 = logicadic.opcion1
					opcion2 = logicadic.opcion2
					mensaje.set_visible(false)
					#get_node("../player").set_interactuando(true) 
					count=0
					get_node("../3secTimer"+nombre).start()
					get_node("../player/Pregunta").set_text(str (textos[0].texto))
					get_node("../player/Opcion1").set_text('')
					get_node("../player/Opcion2").set_text('')
					get_node("../player/Pregunta").visible = true
					get_node("../player/Opcion1").visible = true
					get_node("../player/Opcion2").visible = true
					get_node("../player/fondo").visible = true
					print("*********************************************")
					print(get_node("../player").interactuando)
				else:
					nomore = true
			else:
				if Input.is_action_just_pressed("ui_up") and get_node("../player").interactuando == true:
					end=1
					get_node("../3secTimer1").start()
					print (opcion1)
					print (opcion2)
					if last_press == 0:
						logica.npc_set_state(1,opcion2.valor)
						textos = opcion2.selected
						textoslen = len(opcion2.selected)
					if last_press==1:
						logica.npc_set_state(1,opcion1.valor)
						textos = opcion1.selected
						textoslen = len(opcion1.selected)						
					#get_node("../player").interactuando = false
					get_node("../player/Opcion1").visible = false
					get_node("../player/Opcion2").visible = false
		pass




func _on_3secTimer1_timeout():
	if end ==0:
		print ("end = 0")
		count +=1
		print (textos)
		print (textoslen)
		if (count/2) < textoslen:
			get_node("../player/Pregunta").set_text(str (textos[count/2].texto))
		else:
			get_node("../player/Opcion1").set_text(str (opcion1.texto))
			get_node("../player/Opcion2").set_text(str (opcion2.texto))
			get_node("../3secTimer"+nombre).stop()
			count =0
	else:
		print ("end = 1")
		print (count/2)
		print (textoslen)
		
		if (count/2) < textoslen:
			get_node("../player/Pregunta").set_text(str (textos[count/2].texto))
		else:
			if (count/2) < textoslen+2:
				get_node("../player/Pregunta").visible = false
				get_node("../player").interactuando = false
				get_node("../player/fondo").visible = false
				end=0
				get_node("../3secTimer"+nombre).stop()
		count +=1
	pass # replace with function body
