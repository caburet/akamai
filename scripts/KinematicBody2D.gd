extends KinematicBody2D

var motion = Vector2()
var interactuando= false
var velocidad=2000
var max_pos=23000
var ligth_max_pox = [-3600,-3700]
var colors=['#ffffff','#ebd4d4','#ddbdbd','#bb9b9b','#a18686','#776767','#352d2d']
var colornr =0
var last_press = 0
func _physics_process(delta):

	if Input.is_action_pressed("ui_right"):
		last_press = 0
	if Input.is_action_pressed("ui_left"):
		last_press =1	
	if last_press == 0:
		$Opcion1.add_color_override("font_color", Color(0,0,0))
		$Opcion2.add_color_override("font_color", Color(0,0,1))
	if last_press==1:
		$Opcion1.add_color_override("font_color", Color(0,0,1))
		$Opcion2.add_color_override("font_color", Color(0,0,0))
	
	#colornr=int(self.position.x/max_pos*6)
	#print (colornr)
	#$"../Cavas_day_nigth".color=colors[colornr]
	$sun.position.x = (self.position.x/max_pos * ligth_max_pox[0])
	#$sun.position.y = (self.position.x/max_pos * ligth_max_pox[1])
	#print ($sun.position)
	motion.y =+200
	if (Input.is_action_pressed("ui_right" ) )and not interactuando:
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
	pass
func set_interactuando(cosa1):
	interactuando=cosa1

func _on_TouchScreenButton_pressed():
	motion.x = velocidad
	get_node( "Sprite" ).set_flip_h( false )
	pass # replace with function body
