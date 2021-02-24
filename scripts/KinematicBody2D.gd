extends KinematicBody2D
var mensaje 
var motion = Vector2()
var interactuando= false
var velocidad=2000
var max_pos=23000
var ligth_max_pox = [-3600,-3700]
var colors=['#ffffff','#ebd4d4','#ddbdbd','#bb9b9b','#a18686','#776767','#352d2d']
var colornr =0
var last_press = 0
var logicadic
var textoslen
var textos 
var opcion1 
var opcion2 
var nombre
var npc

func _physics_process(delta):
	$sun.position.x = (self.position.x/max_pos * ligth_max_pox[0])
	motion.y =+200
	if Input.is_action_pressed("ui_right" ) and not interactuando:
		motion.x = velocidad
		$Sprite/Anim_pj.play('walk')
		get_node( "Sprite" ).set_flip_h( false )
	elif Input.is_action_pressed("ui_left") and not interactuando :
		motion.x = -velocidad
		$Sprite/Anim_pj.play('walk')
		get_node( "Sprite" ).set_flip_h( true )
	else:
		$Sprite/Anim_pj.play('walk')
		motion.x = 0
		motion.y = 0
	
	move_and_slide(motion)
func _input(event):

	if event.is_action_pressed("ui_right"):
		last_press = 0
	if event.is_action_pressed("ui_left"):
		last_press =1	
	if last_press == 0:
		$Opcion1.add_color_override("font_color", Color(0,0,0))
		$Opcion2.add_color_override("font_color", Color(0,0,1))
	if last_press==1:
		$Opcion1.add_color_override("font_color", Color(0,0,1))
		$Opcion2.add_color_override("font_color", Color(0,0,0))
	if last_press==2:
		$Opcion1.add_color_override("font_color", Color(0,0,0))
		$Opcion2.add_color_override("font_color", Color(0,0,0))


func _on_TouchScreenButton_pressed():
	motion.x = velocidad
	get_node( "Sprite" ).set_flip_h( false )
	pass # replace with function body

func interact_with(event,numero):
			if nombre != numero:
				nombre= numero
				npc = get_node("../npc"+numero)
				get_node("../3secTimer1").stop()
			mensaje = get_node("../npc"+numero+"/burbuja" )
			if self.interactuando == false and !npc.mensaje.is_visible():
				npc.mensaje.set_visible(true)
			if  npc.nomore:
				npc.mensaje.set_visible(false)
				interactuando =false
			if (event.is_action_pressed("ui_up") or event.is_action_pressed("ui_accept")):
				if !get_node("../3secTimer1").is_stopped():
					#get_node("../3secTimer1").stop()
					#_on_3secTimer1_timeout()
					pass
				else:
					if self.interactuando == false:
						print ("interactuando = false")
						logicadic = logica.npc_talk(int(numero))
						print (logicadic)
						if logicadic:
							self.interactuando = true
							textos = logicadic.textos
							
							textoslen = len(logicadic.textos)
							opcion1 = logicadic.opcion1
							opcion2 = logicadic.opcion2
							mensaje.set_visible(false)
							npc.count=0
							get_node("../3secTimer1").start()
							get_node("../player/Pregunta").set_text(str (textos[0].texto))
							if textoslen ==1:
								get_node("../player/Opcion1").set_text(opcion1.texto)
								get_node("../player/Opcion2").set_text(opcion2.texto)
							else:								
								get_node("../player/Opcion1").set_text('')
								get_node("../player/Opcion2").set_text('')
							get_node("../player/Pregunta").visible = true
							get_node("../player/Opcion1").visible = true
							get_node("../player/Opcion2").visible = true
							get_node("../player/fondo").visible = true
						else:
							npc.nomore = true
					else: #interactuando = true
						print ("interactuando = true")
						npc.end=1
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
	get_node("../3secTimer1").stop()
	print ("timeout")
	if (npc.count/2) < textoslen:
		get_node("../player/Pregunta").set_text(str (textos[npc.count/2].texto))
		get_node("../3secTimer1").start()
	else:
		if npc.end ==0:
			get_node("../player/Opcion1").set_text(str (opcion1.texto))
			get_node("../player/Opcion2").set_text(str (opcion2.texto))
			npc.count =0
		else:
			if (npc.count/2) < textoslen+2:
				get_node("../player/Pregunta").visible = false
				get_node("../player").interactuando = false
				get_node("../player/fondo").visible = false
				npc.end=0
	npc.count +=1
