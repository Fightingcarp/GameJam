extends Control

const ZOOM_LIMIT = Vector2(8 , 8)
const ZOOM_SPEED = Vector2(0.1 , 0.1)

var scene_change = false
var zoom_done = false
var zoom_position
var scene_load

@onready var cam = $Camera2D

func _physics_process(delta):
	zoom_process()
	if zoom_done == true:
		play_transition()
		await get_tree().create_timer(0.5).timeout
		zoom_done = false

func _on_firstlvl_pressed():
	scene_change = true
	zoom_position = Vector2(580 , 457)
	

func zoom_process():
	if cam.zoom < ZOOM_LIMIT && scene_change == true:
		cam.position = zoom_position
		cam.zoom += ZOOM_SPEED
		if cam.zoom >= ZOOM_LIMIT:
			zoom_done = true

func play_transition():
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	## scene_load = get_tree().change_scene_to_file()
