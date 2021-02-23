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
var nomore = false
func _physics_process(delta):
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept")) and !get_node("../3secTimer1").is_stopped():
		get_node("../3secTimer1").stop()
		_on_3secTimer1_timeout()
		print ("timer fin")
		return
		pass
	if get_node("../player").interactuando == true or nomore:
		$burbuja.visible=false
	else:
		$burbuja.visible=true

	var bodies = get_overlapping_bodies()
	mensaje.set_visible(false)
	
	for body in bodies:
		if body.name =="player":
			if get_node("../player").interactuando == false:
				mensaje.set_visible(true)
			if nomore:
				mensaje.set_visible(false)
				get_node("../player").set_interactuando(false) 
			if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept")) and get_node("../player").interactuando == false and get_node("../3secTimer1").is_stopped() :
				logicadic = logica.npc_talk(int(nombre))
				if logicadic:
					get_node("../player").interactuando = true
					textos = logicadic.textos
					textoslen = len(logicadic.textos)
					opcion1 = logicadic.opcion1
					opcion2 = logicadic.opcion2
					mensaje.set_visible(false)
					count=0
					get_node("../3secTimer"+nombre).start()
					get_node("../player/Pregunta").set_text(str (textos[0].texto))
					get_node("../player/Opcion1").set_text('')
					get_node("../player/Opcion2").set_text('')
					get_node("../player/Pregunta").visible = true
					get_node("../player/Opcion1").visible = true
					get_node("../player/Opcion2").visible = true
					get_node("../player/fondo").visible = true
				else:
					nomore = true
			else:
				if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept")) and get_node("../player").interactuando == true and get_node("../3secTimer1").is_stopped(): 
					end=1
					get_node("../3secTimer1").start()
					if $"../player".last_press == 0:
						logica.npc_set_state(1,opcion2.valor)
						textos = opcion2.selected
						textoslen = len(opcion2.selected)
					if $"../player".last_press==1:
						logica.npc_set_state(1,opcion1.valor)
						textos = opcion1.selected
						textoslen = len(opcion1.selected)						
					get_node("../player/Opcion1").visible = false
					get_node("../player/Opcion2").visible = false




func _on_3secTimer1_timeout():
	if end ==0:
		count +=1
		if (count/2) < textoslen:
			get_node("../player/Pregunta").set_text(str (textos[count/2].texto))
		else:
			get_node("../player/Opcion1").set_text(str (opcion1.texto))
			get_node("../player/Opcion2").set_text(str (opcion2.texto))
			get_node("../3secTimer"+nombre).stop()
			count =0
	else:
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
