extends Control

const ZOOM_LIMIT = Vector2(8 , 8)
const ZOOM_SPEED = Vector2(0.1 , 0.1)

var zoom = false

@onready var cam = $Camera2D

func _physics_process(delta):
	if cam.zoom < ZOOM_LIMIT && zoom == true:
		cam.position = Vector2(586 , 451)
		cam.zoom += ZOOM_SPEED
		
	## 586 451
func _on_firstlvl_pressed():
	zoom = true
