extends Area2D
onready var mensaje = get_node( "burbuja" )
var nombre= '1'
var nomore = false
var count =0
var end =0
func _input(event):
	if get_node("../player").interactuando == true or nomore:
		$burbuja.visible=false
	else:
		$burbuja.visible=true
	var areas = get_overlapping_areas()
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name =="player":
			get_node("../player").interact_with(event,nombre)
