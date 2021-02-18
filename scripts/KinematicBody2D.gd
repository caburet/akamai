extends KinematicBody2D

var motion = Vector2()
var interactuando= false
var velocidad=20000

func _physics_process(delta):
	motion.y =+200
	if (Input.is_action_pressed("ui_right" ) )and not interactuando:
		motion.x = velocidad
		get_node( "Sprite" ).set_flip_h( false )
	elif Input.is_action_pressed("ui_left") and not interactuando :
		motion.x = -velocidad
		get_node( "Sprite" ).set_flip_h( true )
	else:
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
