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
var textoslenrta
var textosrta
var opcion1 
var opcion2 
var nombre
var npc
onready var pregunta=$"../CanvasLayer/Pregunta"
onready var opcion1_gui=$"../CanvasLayer/Opcion1"
onready var opcion2_gui=$"../CanvasLayer/Opcion2"


func _physics_process(delta):
	if logica.guiso:
		$"../CanvasLayer/carne".show()
	else:
		$"../CanvasLayer/carne".hide()
	if logica.moneda:
		$"../CanvasLayer/moneda".show()
	else:
		$"../CanvasLayer/moneda".hide()		
	if logica.hueso:
		$"../CanvasLayer/hueso".show()
	else:
		$"../CanvasLayer/hueso".hide()				
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
		opcion1_gui.add_color_override("font_color", Color(0,0,0))
		opcion2_gui.add_color_override("font_color", Color(0,0,1))
	if last_press==1:
		opcion1_gui.add_color_override("font_color", Color(0,0,1))
		opcion2_gui.add_color_override("font_color", Color(0,0,0))
	if last_press==2:
		opcion1_gui.add_color_override("font_color", Color(0,0,0))
		opcion2_gui.add_color_override("font_color", Color(0,0,0))


func _on_TouchScreenButton_pressed():
	motion.x = velocidad
	get_node( "Sprite" ).set_flip_h( false )
	pass # replace with function body

func show_interface(show):
	if show:
		pregunta.visible = true
		opcion1_gui.visible = true
		opcion2_gui.visible = true
	else:
		pregunta.visible = false
		opcion1_gui.visible = false
		opcion2_gui.visible = false		
	pass
	
func interact_with(event,numero):
			if nombre != numero:
				nombre= numero
				npc = get_node("../npc"+numero)
				npc.end=0
			mensaje = get_node("../npc"+numero+"/burbuja" )
			if self.interactuando == false and !npc.mensaje.is_visible():
				npc.mensaje.set_visible(true)
			if  npc.nomore:
				npc.mensaje.set_visible(false)
				interactuando =false
			if (event.is_action_pressed("ui_up") or event.is_action_pressed("ui_accept")):
					#Inicia charla
					if self.interactuando == false:
						print ("interactuando == false")
						logicadic = logica.npc_talk(int(numero))
						if !logicadic:
							npc.nomore = true
						else:
							print ("interactuando = true")
							self.interactuando = true
							textos = logicadic.textos
							textoslen = len(logicadic.textos)
							opcion1 = logicadic.opcion1
							opcion2 = logicadic.opcion2
							print (textos)
							print (opcion1)
							print (opcion2)	
							mensaje.set_visible(false)
							npc.count=0
							textosrta=''
							pregunta.set_text(str (textos[npc.count].texto))
							if npc.count%2==0:
								pregunta.set("custom_colors/font_color", Color(npc.textcolor))
							else:
								pregunta.set("custom_colors/font_color", Color('#000000'))
							show_interface(true)
							if textoslen ==1:
								opcion1_gui.set_text(opcion1.texto)
								opcion2_gui.set_text(opcion2.texto)
								npc.end=1
							else:								
								opcion1_gui.set_text('')
								opcion2_gui.set_text('')							
								npc.end=0
							npc.count+=1	
					else: #self.interactuando == true
						# Esta interactuando desde antes
						#si tengo aun dialogo
						if npc.end==0:
							print ("if1")
							if npc.count == textoslen-1:
								print ("if2")
								if npc.count%2==0:
									pregunta.set("custom_colors/font_color", Color(npc.textcolor))
								else:
									pregunta.set("custom_colors/font_color", Color('#000000'))								
								pregunta.set_text(str (textos[npc.count].texto))
								opcion1_gui.set_text(opcion1.texto)
								opcion2_gui.set_text(opcion2.texto)
								npc.end=1
								npc.countrta=0
							elif npc.count < textoslen-1:
								print ("if3")
								if npc.count%2==0:
									pregunta.set("custom_colors/font_color", Color(npc.textcolor))
								else:
									pregunta.set("custom_colors/font_color", Color('#000000'))								
								pregunta.set_text(str (textos[npc.count].texto))
								npc.count+=1								
						# Termino el dialogo
						else: #npc.end=1
							print ("if4")
							
							if !textosrta: # recupero respuesta y cambio de estado
								print ("if5")
								npc.countrta=0
								if npc.countrta%2==1:
									pregunta.set("custom_colors/font_color", Color(npc.textcolor))
								else:
									pregunta.set("custom_colors/font_color", Color('#000000'))													
								if $"../player".last_press == 0:
									logica.npc_set_state(numero,opcion2.valor)
									textosrta = opcion2.selected
									textoslenrta = len(opcion2.selected)
								if $"../player".last_press==1:
									logica.npc_set_state(numero,opcion1.valor)
									textosrta = opcion1.selected
									textoslenrta = len(opcion1.selected)						
								pregunta.set_text(str (textosrta[npc.countrta].texto))
								opcion1_gui.visible = false
								opcion2_gui.visible = false	
								npc.countrta+=1
							else:
								if npc.countrta<textoslenrta:
									print ("if6")
									if npc.countrta%2==1:
										pregunta.set("custom_colors/font_color", Color(npc.textcolor))
									else:
										pregunta.set("custom_colors/font_color", Color('#000000'))															
									pregunta.set_text(str (textosrta[npc.countrta].texto))
									npc.countrta+=1
								else:
									print ("if7")
									get_node("../player").interactuando = false
									show_interface(false)
									pass
								pass
								
